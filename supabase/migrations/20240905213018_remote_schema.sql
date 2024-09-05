create extension if not exists "postgis" with schema "extensions";


create schema if not exists "postgis";


alter table "public"."CompetitionDiscipline" drop column "disciplineName";

alter table "public"."Location" drop column "lat";

alter table "public"."Location" drop column "lng";

alter table "public"."Location" add column "location" geography;

CREATE INDEX location_geo_index ON public."Location" USING gist (location);


