alter table "public"."Entry" add column "ageGroup" character varying not null;

CREATE UNIQUE INDEX "Entry_athlete_competition_discipline_key1" ON public."Entry" USING btree (athlete, competition, discipline);

alter table "public"."Entry" add constraint "Entry_athlete_competition_discipline_key1" UNIQUE using index "Entry_athlete_competition_discipline_key1";

create policy "Enable read access for all users"
on "public"."Athlete"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."Competition"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."Discipline"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."Entry"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."Location"
as permissive
for select
to public
using (true);



