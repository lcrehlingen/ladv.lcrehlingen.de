alter table "public"."Entry" drop constraint "Entry_athlete_competition_discipline_key";

alter table "public"."Entry" drop constraint "Entry_athlete_competition_discipline_key1";

drop index if exists "public"."Entry_athlete_competition_discipline_key";

drop index if exists "public"."Entry_athlete_competition_discipline_key1";

alter table "public"."AgeGroup" add column "shortName" text;

alter table "public"."Entry" alter column "ageGroup" set data type bigint using "ageGroup"::bigint;

alter table "public"."Entry" alter column "discipline" set data type bigint using "discipline"::bigint;

alter table "public"."Entry" add constraint "Entry_ageGroup_fkey" FOREIGN KEY ("ageGroup") REFERENCES "AgeGroup"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."Entry" validate constraint "Entry_ageGroup_fkey";

alter table "public"."Entry" add constraint "Entry_discipline_fkey" FOREIGN KEY (discipline) REFERENCES "Discipline"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."Entry" validate constraint "Entry_discipline_fkey";


