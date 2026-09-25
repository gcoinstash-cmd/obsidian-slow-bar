-- OBSIDIAN LAB // Artisanal Micro-Roastery & Tasting Room OS
-- Supabase Production PostgreSQL Schema with Row Level Security (RLS)

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- 1. Coffee Beans Catalog & Batch Inventory
create table if not exists public.coffee_beans (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  sub_name text not null,
  origin text not null,
  tasting_notes text[] not null,
  elevation text not null,
  roast_level text not null,
  process_type text not null,
  description text not null,
  price numeric(10,2) not null,
  image_url text not null,
  is_limited_edition boolean default false,
  score integer default 90,
  stock_left integer default 20,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Tasting Bar Reservations (Omakase & Chemistry Masterclasses)
create table if not exists public.tasting_reservations (
  id uuid primary key default uuid_generate_v4(),
  session_title text not null,
  guest_name text not null,
  guest_email text not null,
  seats integer default 1,
  total_price numeric(10,2) not null,
  reservation_date text not null,
  reservation_time text not null,
  status text default 'Confirmed',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 3. Roasters Alliance Subscriptions
create table if not exists public.subscriptions (
  id uuid primary key default uuid_generate_v4(),
  tier_name text not null,
  subscriber_name text not null,
  subscriber_email text not null,
  grind_spec text default 'Whole Bean',
  monthly_price numeric(10,2) not null,
  status text default 'Active',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. Customer Verified Reviews
create table if not exists public.reviews (
  id uuid primary key default uuid_generate_v4(),
  coffee_id text not null,
  reviewer_name text not null,
  rating integer default 5,
  title text not null,
  content text not null,
  roast_tag text,
  verified_purchase boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Row Level Security (RLS)
alter table public.coffee_beans enable row level security;
alter table public.tasting_reservations enable row level security;
alter table public.subscriptions enable row level security;
alter table public.reviews enable row level security;

-- Public Read Policies
create policy "Allow read coffee beans" on public.coffee_beans for select using (true);
create policy "Allow read reviews" on public.reviews for select using (true);

-- Public Insert Policies
create policy "Allow insert reservations" on public.tasting_reservations for insert with check (true);
create policy "Allow insert subscriptions" on public.subscriptions for insert with check (true);
create policy "Allow insert reviews" on public.reviews for insert with check (true);

-- Admin Full Access Policies
create policy "Allow admin manage beans" on public.coffee_beans using (true);
create policy "Allow admin manage reservations" on public.tasting_reservations using (true);
create policy "Allow admin manage subscriptions" on public.subscriptions using (true);
