{% macro select_tbl(src_tbl, tst_tbl) %}

      {% if var('unit_testing', false) == true %}
            
            {{ return(tst_tbl) }}

      {% else %}

            {{ return(src_tbl) }}

      {% endif %}

{% endmacro %}