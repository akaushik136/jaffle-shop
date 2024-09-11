{# A basic example for a project-wide macro to cast a column uniformly #}

{% macro cents_to_inr(column_name) -%}
    {{ return(adapter.dispatch('cents_to_inr')(column_name)) }}
{%- endmacro %}

{% macro default__cents_to_inr(column_name) -%}
    ({{ column_name }} / 100) * 82::numeric(16, 2)
{%- endmacro %}

{% macro postgres__cents_to_inr(column_name) -%}
    ({{ column_name }}::numeric(16, 2) / 100) * 82
{%- endmacro %}

{% macro bigquery__cents_to_inr(column_name) %}
    ROUND(CAST(({{ column_name }} / 100) * 82 AS NUMERIC), 2)
{% endmacro %}
