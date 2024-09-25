-- CreateTable
CREATE TABLE "AgeGroup" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "official" BOOLEAN NOT NULL,
    "shortName" TEXT,

    CONSTRAINT "AgeGroup_pkey1" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Athlete" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "birthyear" INTEGER NOT NULL,

    CONSTRAINT "Athlete_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Competition" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "venue" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "canceled" BOOLEAN NOT NULL,
    "email" TEXT NOT NULL,
    "location" INTEGER NOT NULL,
    "entryDeadline" DATE NOT NULL,
    "lv" INTEGER,
    "host" INTEGER NOT NULL,
    "organizer" INTEGER NOT NULL,

    CONSTRAINT "Competition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompetitionDiscipline" (
    "competition" INTEGER NOT NULL,
    "discipline" INTEGER NOT NULL,
    "ageGroup" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Discipline" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "official" BOOLEAN NOT NULL,

    CONSTRAINT "AgeGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Entry" (
    "id" SERIAL NOT NULL,
    "athlete" INTEGER NOT NULL,
    "competition" INTEGER NOT NULL,
    "ageGroup" INTEGER NOT NULL,
    "discipline" INTEGER NOT NULL,

    CONSTRAINT "Entry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Federation" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Federation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Location" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lv" INTEGER,
    "country" INTEGER NOT NULL,
    "long" INTEGER NOT NULL,
    "lat" INTEGER NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Organisation" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Organisation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AgeGroup_code_key" ON "AgeGroup"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Athlete_firstname_lastname_birthyear_key" ON "Athlete"("firstname", "lastname", "birthyear");

-- CreateIndex
CREATE UNIQUE INDEX "CompetitionDiscipline_discipline_competition_ageGroup_key" ON "CompetitionDiscipline"("discipline", "competition", "ageGroup");

-- CreateIndex
CREATE UNIQUE INDEX "Country_code_key" ON "Country"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Country_name_key" ON "Country"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Discipline_code_key" ON "Discipline"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Organisation_name_key" ON "Organisation"("name");

-- AddForeignKey
ALTER TABLE "Competition" ADD CONSTRAINT "Competition_host_fkey" FOREIGN KEY ("host") REFERENCES "Organisation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Competition" ADD CONSTRAINT "Competition_location_fkey" FOREIGN KEY ("location") REFERENCES "Location"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Competition" ADD CONSTRAINT "Competition_lv_fkey" FOREIGN KEY ("lv") REFERENCES "Federation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Competition" ADD CONSTRAINT "Competition_organizer_fkey" FOREIGN KEY ("organizer") REFERENCES "Organisation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionDiscipline" ADD CONSTRAINT "CompetitionDiscipline_ageGroup_fkey" FOREIGN KEY ("ageGroup") REFERENCES "AgeGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionDiscipline" ADD CONSTRAINT "CompetitionDiscipline_discipline_fkey" FOREIGN KEY ("discipline") REFERENCES "Discipline"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionDiscipline" ADD CONSTRAINT "Discipline_competition_fkey" FOREIGN KEY ("competition") REFERENCES "Competition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entry" ADD CONSTRAINT "Entry_ageGroup_fkey" FOREIGN KEY ("ageGroup") REFERENCES "AgeGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entry" ADD CONSTRAINT "Entry_athlete_fkey" FOREIGN KEY ("athlete") REFERENCES "Athlete"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entry" ADD CONSTRAINT "Entry_competition_fkey" FOREIGN KEY ("competition") REFERENCES "Competition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entry" ADD CONSTRAINT "Entry_discipline_fkey" FOREIGN KEY ("discipline") REFERENCES "Discipline"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_country_fkey" FOREIGN KEY ("country") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_lv_fkey" FOREIGN KEY ("lv") REFERENCES "Federation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
