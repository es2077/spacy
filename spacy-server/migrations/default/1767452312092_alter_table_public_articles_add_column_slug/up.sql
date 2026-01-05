alter table "public"."articles" add column "slug" text
 not null unique;
