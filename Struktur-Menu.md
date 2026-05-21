🟦 FINAL ERP STRUCTURE (RECOMMENDED)

1. DASHBOARD
   Dashboard
   ├── Overview
   │ ├── Sales Summary
   │ ├── Inventory Summary
   │ ├── AR / AP Summary
   │ └── Cash Flow Snapshot
   │
   ├── Alerts & Notifications
   │ ├── Low Stock
   │ ├── Overdue Receivable
   │ ├── Pending Approval
   │ └── Expired Product
   │
   └── Activity Summary
   ├── Recent Transactions
   ├── User Activities
   └── Approval Queue

2. MASTER DATA
   Master Data
   │
   ├── Organization
   │ ├── Company
   │ ├── Branch / Location
   │ └── Department
   │
   ├── Inventory Master
   │ ├── Product
   │ ├── Product Category
   │ ├── Brand
   │ ├── UOM
   │ ├── Warehouse
   │ └── Storage Location
   │
   ├── Sales Master
   │ ├── Customer
   │ ├── Customer Category
   │ ├── Salesman
   │ ├── Sales Area
   │ └── Price List
   │
   ├── Purchasing Master
   │ ├── Supplier
   │ └── Supplier Category
   │
   ├── Finance Master
   │ ├── Currency
   │ ├── Payment Method
   │ ├── Payment Term (TOP)
   │ ├── Bank
   │ ├── Tax
   │ └── Chart of Account
   │
   ├── Asset Master
   │ ├── Asset Category
   │ ├── Asset Brand
   │ ├── Asset Location
   │ ├── Asset Condition
   │ └── Depreciation Method
   │
   ├── HR Master
   │ ├── Employee
   │ ├── Position
   │ ├── Employment Type
   │ └── Leave Type
   │
   ├── System Reference
   │ ├── Document Status
   │ ├── Approval Status
   │ └── Transaction Type
   │
   └── User & Access
   ├── User
   ├── Role
   └── Permission

3. SALES
   Sales
   │
   ├── Transaction
   │ ├── Sales Quotation
   │ ├── Sales Order
   │ ├── Delivery Order
   │ ├── Sales Invoice
   │ └── Sales Return
   │
   ├── Account Receivable
   │ ├── Customer Invoice
   │ ├── Receipt (Payment In)
   │ ├── Credit Note
   │ └── AR Adjustment
   │
   └── Monitoring
   ├── Outstanding Sales Order
   ├── Delivery Status
   └── AR Aging

4. PURCHASING
   Purchasing
   │
   ├── Transaction
   │ ├── Purchase Request
   │ ├── Purchase Order
   │ ├── Goods Receipt
   │ ├── Purchase Invoice
   │ └── Purchase Return
   │
   ├── Account Payable
   │ ├── Supplier Invoice
   │ ├── Payment Out
   │ ├── Debit Note
   │ └── AP Adjustment
   │
   └── Monitoring
   ├── Outstanding PO
   ├── Supplier Delivery
   └── AP Aging

5. INVENTORY
   Inventory
   │
   ├── Transaction
   │ ├── Stock In
   │ ├── Stock Out
   │ ├── Stock Transfer
   │ ├── Stock Adjustment
   │ └── Stock Opname
   │
   ├── Monitoring
   │ ├── Stock Card
   │ ├── Stock Balance
   │ ├── Slow Moving
   │ └── Expired / Near Expired
   │
   └── Reporting Tools
   ├── Stock Mutation
   └── Inventory Valuation

6. ASSET MANAGEMENT
   Asset Management
   │
   ├── Asset Registration
   │ ├── Asset List
   │ ├── Asset Assignment
   │ └── Asset QR / Barcode
   │
   ├── Asset Transaction
   │ ├── Asset Transfer
   │ ├── Asset Maintenance
   │ ├── Asset Disposal
   │ └── Asset Mutation
   │
   ├── Depreciation
   │ ├── Depreciation Process
   │ ├── Depreciation Journal
   │ └── Asset Book Value
   │
   └── Monitoring
   ├── Asset Tracking
   ├── Asset History
   ├── Maintenance Schedule
   └── Asset Condition 7. HR MINI

7. HR MANAGEMENT
   HR Management
   │
   ├── Employee Management
   │ ├── Employee List
   │ ├── Employee Mutation
   │ └── Employee Document
   │
   ├── Attendance
   │ ├── Attendance Log
   │ ├── Shift Schedule
   │ └── Attendance Correction
   │
   ├── Leave Management
   │ ├── Leave Request
   │ ├── Leave Approval
   │ └── Leave Balance
   │
   └── Monitoring
   ├── Attendance Summary
   └── Employee Status 8. FINANCE

8. FINANCE
   Finance
   │
   ├── Cash & Bank
   │ ├── Cash Receipt
   │ ├── Cash Payment
   │ ├── Bank Receipt
   │ ├── Bank Payment
   │ └── Bank Reconciliation
   │
   ├── Accounting
   │ ├── Journal Entry
   │ ├── Journal Approval
   │ ├── Closing Period
   │ └── Opening Balance
   │
   ├── Tax
   │ ├── Tax Transaction
   │ ├── VAT Report
   │ └── Withholding Tax
   │
   └── Monitoring
   ├── Cash Flow
   ├── Profit & Loss
   └── Balance Sheet 9. REPORTS

9. REPORTING
   Reports
   │
   ├── Sales Report
   ├── Purchasing Report
   ├── Inventory Report
   ├── Finance Report
   ├── Asset Report
   ├── HR Report
   └── Tax Report 10. SYSTEM

10. SYSTEM SETTING
    System
    │
    ├── Menu Management
    ├── Workflow & Approval
    ├── Notification
    ├── Audit Log
    ├── Import / Export
    ├── Backup & Restore
    └── System Configuration
