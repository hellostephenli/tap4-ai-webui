CREATE TABLE IF NOT EXISTS public.submit (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  name text NULL,
  url text NULL,
  email text NULL,
  is_feature integer default 0,
  status integer default 0,
  CONSTRAINT submit_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;
-- 查询submit表，按提交时间，status=0（未处理），按照is_feature desc, created_at asc
-- 得到结果后，写入web_navigation，同时修改submit的status=1

create table if not exists public.navigation_category (
    id bigint primary key generated always as identity,
    name text not null,
    title text,
    sort integer,
    del_flag integer default 0, -- 默认值可以设为0，但COMMENT要单独写
    create_by bigint default 0, -- 默认值可以设为0，但COMMENT要单独写
    create_time timestamp with time zone not null default now()
  ) TABLESPACE pg_default;

-- 添加注释
comment on column public.navigation_category.del_flag is '是否删除 0:未删除 1:删除';
comment on column public.navigation_category.create_by is '创建者';


CREATE TABLE IF NOT EXISTS public.web_navigation (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  name TEXT PRIMARY KEY,
  title TEXT,
  content TEXT,
  detail TEXT,
  url TEXT,
  image_url TEXT,
  thumbnail_url TEXT,
  website_data TEXT,
  collection_time TIMESTAMPTZ,
  star_rating INTEGER,
  tag_name TEXT,
  category_name TEXT
) TABLESPACE pg_default;
