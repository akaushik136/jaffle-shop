{% snapshot order_rupees_snapshot %}

    {{
        config(
            target_schema='snapshots',   
            unique_key='order_id',       
            strategy='timestamp',        
            updated_at='ordered_at'
        )
    }}

    select
        *
    from {{ ref('order_rupees') }}

{% endsnapshot %}
