DROP TABLE IF EXISTS public.media cascade;
CREATE TABLE public.media (
    id SERIAL PRIMARY KEY,
    name varchar(128) NOT NULL,
    type character(1) CHECK (type in ('V', 'I')),
    quality smallint,
    rating smallint,
    tags text,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0,
	size bigint default 0,
	duration varchar(8),
	upload_date timestamp default current_timestamp,
	last_seen timestamp
);

DROP TABLE IF EXISTS public.video;
CREATE TABLE public.video (
    id SERIAL PRIMARY KEY REFERENCES public.media (id),
	thumbnail bytea,
	content bytea NOT NULL
);

DROP TABLE IF EXISTS public.image;
CREATE TABLE public.image (
    id SERIAL PRIMARY KEY REFERENCES public.media (id),
	thumbnail bytea,
	content bytea NOT NULL
);

/*
 REQUESTED			Initialized progress
 PROC_START		Processing content started
 THUMB_DONE		Success - Generate Thumbnail
 THUMB_FAIL		Failure - Generating Thumbnail failed
 SAVE_DONE		Success - Saved content and thumbnail
 SAVE_FAIL		Failure - content and thumbnail
*/
DROP TABLE IF EXISTS public.upload_progress cascade;
CREATE TABLE public.upload_progress (
    id varchar(36) PRIMARY KEY,
	media_id bigint NOT NULL,
	status varchar(16) NOT NULL,
	start_time timestamp NOT NULL default current_timestamp,
	end_time timestamp,
	error_message text
);

DROP TABLE IF EXISTS public.activity_progress cascade;
CREATE TABLE public.activity_progress (
    id varchar(36) PRIMARY KEY,
	activity varchar(36) NOT NULL,
	total smallint default 0,
	success smallint default 0,
	failed smallint default 0,
	skipped smallint default 0,
	start_time timestamp NOT NULL default current_timestamp,
	end_time timestamp
);
