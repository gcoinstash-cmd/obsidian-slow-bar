-- OBSIDIAN LAB: Starter Seed Data for Production Verification

-- 1. Coffee Beans Catalog
insert into public.coffee_beans (name, sub_name, origin, tasting_notes, elevation, roast_level, process_type, description, price, image_url, is_limited_edition, score, stock_left)
values
  ('Wush Wush Gesha', 'ANAEROBIC HONEY MICRO-LOT', 'Kaffa Province, Ethiopia', ARRAY['Bergamot', 'White Tea', 'Candied Ginger', 'Jasmine'], '2,150 MASL', 'light', '120hr Anaerobic Honey', 'An exceptional crop sourced from wild micro-plots. This Gesha specimen undergoes sealed anaerobic chambers for 120 hours before honey-depulping, unlocking rare lavender florality and clean tea-like translucency.', 36.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&q=80&w=800', true, 95, 14),
  ('Esmeralda Special', 'THE GOLDEN SEED SERIES', 'Boquete, Panama', ARRAY['Leche Citron', 'Dried Apricot', 'Orange Blossom', 'Jasmine Honey'], '1,950 MASL', 'light', 'Carbonic Maceration Natural', 'Widely considered the pinnacle of modern specialty coffee. Originating from the elite dry-plots of Hacienda La Esmeralda, it blooms in the cup with a fragrance resembling a fine perfume.', 64.00, 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&q=80&w=800', true, 97, 6),
  ('El Paraiso Lychee', 'THERMAL SHOCK INNOVATOR', 'Cauca, Colombia', ARRAY['Lychee syrup', 'Greek Yogurt', 'Passion Fruit', 'Pink Grapefruit'], '1,850 MASL', 'light-medium', 'Thermal Shock Double Fermentation', 'A mind-bending profile from Diego Bermudez. Injected with specific native yeasts during high-pressure thermal shock, this coffee is incredibly fruity, tasting of pure lychee compote.', 38.00, 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&q=80&w=800', false, 94, 32);

-- 2. Tasting Bar Reservations
insert into public.tasting_reservations (session_title, guest_name, guest_email, seats, total_price, reservation_date, reservation_time, status)
values
  ('The Slow-Bar Omakase', 'Julian Sterling', 'sterling@private.io', 2, 150.00, 'Saturday, May 30', '11:00 AM — 12:30 PM', 'Confirmed'),
  ('Extraction Chemistry Masterclass', 'Elena Rostova', 'elena@olympic.org', 1, 95.00, 'Sunday, May 31', '10:00 AM — 11:30 AM', 'Confirmed');

-- 3. Alliance Subscriptions
insert into public.subscriptions (tier_name, subscriber_name, subscriber_email, grind_spec, monthly_price, status)
values
  ('The Obsidian Reserve', 'Marcus Vance', 'vance@apex.club', 'Whole Bean', 89.00, 'Active');
