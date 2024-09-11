{# A basic example for a project-wide macro to cast a column uniformly #}

{% macro dollars_to_inr(column_name) -%}
    {{ return(adapter.dispatch('dollars_to_inr')(column_name)) }}
{%- endmacro %}

{% macro default__dollars_to_inr(column_name) -%}
    ({{ column_name }}) * 82::numeric(16, 2)
{%- endmacro %}

{% macro postgres__dollars_to_inr(column_name) -%}
    ({{ column_name }}::numeric(16, 2) ) * 82
{%- endmacro %}

{% macro bigquery__dollars_to_inr(column_name) %}
    ROUND(CAST(({{ column_name }} ) * 82 AS NUMERIC), 2)
{% endmacro %}
