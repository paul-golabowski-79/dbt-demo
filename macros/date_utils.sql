{% macro season_of_year(ts)%}

CASE
    WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (1, 2, 12) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (3, 4, 5) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (6, 7, 8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END

{% endmacro %}

{% macro day_type(ts) %}

CASE
    WHEN DAYNAME(TO_TIMESTAMP({{ts}})) IN ('Sat', 'Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END

{% endmacro %}