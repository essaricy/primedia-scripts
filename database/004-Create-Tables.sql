DROP TABLE IF EXISTS public.media cascade;
CREATE TABLE public.media (
    id SERIAL PRIMARY KEY,
    name varchar(128) NOT NULL,
    type character(1) CHECK (type in ('V', 'P')),
    quality varchar(8) CHECK (quality in ('LOW', 'MEDIUM', 'HIGH', 'HD')),
    rating smallint CHECK (rating in (1, 2, 3, 4, 5)),
    tags text,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0
);

DROP TABLE IF EXISTS public.video;
CREATE TABLE public.video (
    id SERIAL PRIMARY KEY REFERENCES public.media (id),
	content bytea NOT NULL
);

DROP TABLE IF EXISTS public.image;
CREATE TABLE public.image (
    id SERIAL PRIMARY KEY REFERENCES public.media (id),
	content bytea NOT NULL
);
