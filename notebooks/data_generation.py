import pandas as pd
import random
from datetime import timedelta

suppliers = pd.read_csv("../data/raw/suppliers.csv")
materials = pd.read_csv("../data/raw/materials.csv")

purchase_orders = []
deliveries = []

dates = pd.date_range("2024-01-01", "2025-12-31")

for i in range(1, 10001):
    po_id = f"PO{i:06d}"
    delivery_id = f"DEL{i:06d}"

    order_date = random.choice(dates)

    supplier = suppliers.sample(1).iloc[0]
    material = materials.sample(1).iloc[0]

    category = material["Category"]

    if category == "Fasteners":
        qty = random.randint(1000, 10000)
        price = random.randint(5, 50)

    elif category == "Bearings":
        qty = random.randint(200, 1000)
        price = random.randint(300, 1200)

    elif category == "Electronics":
        qty = random.randint(50, 300)
        price = random.randint(500, 2500)

    elif category == "Lubricants":
        qty = random.randint(20, 200)
        price = random.randint(500, 3000)

    else:
        qty = random.randint(100, 1000)
        price = random.randint(200, 5000)

    total_cost = qty * price

    purchase_orders.append([
        po_id,
        order_date.date(),
        supplier["Supplier_ID"],
        material["Material_ID"],
        qty,
        price,
        total_cost
    ])

    promised_date = order_date + timedelta(
        days=int(supplier["Lead_Time_Days"])
    )

    delay = random.randint(-2, 5)

    delivery_date = promised_date + timedelta(days=delay)

    deliveries.append([
        delivery_id,
        po_id,
        promised_date.date(),
        delivery_date.date(),
        delay
    ])

po_df = pd.DataFrame(
    purchase_orders,
    columns=[
        "PO_ID",
        "Order_Date",
        "Supplier_ID",
        "Material_ID",
        "Quantity",
        "Unit_Price",
        "Total_Cost"
    ]
)

delivery_df = pd.DataFrame(
    deliveries,
    columns=[
        "Delivery_ID",
        "PO_ID",
        "Promised_Date",
        "Delivery_Date",
        "Delay_Days"
    ]
)

po_df.to_csv("../data/raw/purchase_orders.csv", index=False)
delivery_df.to_csv("../data/raw/deliveries.csv", index=False)

print("Data generated successfully.")