ALTER TABLE "public"."Entry" ADD UNIQUE (athlete, competition, discipline);


ALTER TABLE "public"."Athlete" ADD UNIQUE (firstname,lastname,birthyear);