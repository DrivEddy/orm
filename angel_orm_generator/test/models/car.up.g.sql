CREATE TEMPORARY TABLE "cars" (
  "id" serial,
  "make" varchar,
  "description" varchar,
  "family_friendly" boolean,
  "recalled_at" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp,
  PRIMARY KEY(id)
);
