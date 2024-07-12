COMMENT ON TABLE person_discounts IS 'Таблица хранит информацию о скидках, предоставляемых клиентам различных пиццерий, в целях стимулирования продаж и лояльности клиентов.';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи скидки.';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, получающего скидку.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, предоставляющей скидку.';

COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах. Значение по умолчанию — 0, допустимый диапазон от 0 до 100%.';