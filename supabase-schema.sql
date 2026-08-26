-- Cloud Atlas 后续共享版数据库草案
-- 目前 GitHub Pages MVP 不需要执行此文件。

create table if not exists clouds (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid,
  latitude double precision not null,
  longitude double precision not null,
  height_km double precision not null,
  estimated_size_km double precision not null,
  model_size_km double precision not null,
  cloud_type text,
  texture_url text,
  model_url text,
  model_backup boolean default false,
  created_at timestamptz default now(),
  last_seen_at timestamptz default now()
);

create table if not exists cloud_requests (
  id uuid primary key default gen_random_uuid(),
  from_cloud_id uuid references clouds(id) on delete cascade,
  to_cloud_id uuid references clouds(id) on delete cascade,
  request_type text not null check (request_type in ('shrink','raise')),
  proposed_value double precision,
  status text not null default 'pending'
    check (status in ('pending','accepted','rejected','countered')),
  created_at timestamptz default now()
);

-- 生产环境再启用 PostGIS：
-- create extension if not exists postgis;
-- alter table clouds add column if not exists geom geography(Point,4326);
