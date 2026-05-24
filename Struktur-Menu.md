🟦 FINAL ERP STRUCTURE (RECOMMENDED)

DASHBOARD
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

MASTER DATA MANAGEMENT
│
├── Organization
│ ├── Company
│ ├── Branch / Location
│ └── Department
│
├── Inventory Master
│ ├── Product
│ ├── Product Group
│ ├── Brand
│ ├── UOM
│ ├── Warehouse
│ └── Storage Location
│
├── Sales Master
│ ├── Customer Group
│ ├── Customer
│ ├── Salesman
│ ├── Sales Area
│ └── Mapping Area
│
├── Purchasing Master
│ ├── Supplier Group
│ └── Supplier
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
│ ├── Asset Group
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

SALES & Distribution
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

PROCUREMENT & INVENTORY
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

INVENTORY
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

ASSET MANAGEMENT
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

HR MANAGEMENT
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

FINANCE
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
└── Balance Sheet

REPORTING
│
├── Sales Report
├── Purchasing Report
├── Inventory Report
├── Finance Report
├── Asset Report
├── HR Report
└── Tax Report

SYSTEM SETTING
│
├── Menu Management
├── Workflow & Approval
├── Notification
├── Audit Log
├── Import / Export
├── Backup & Restore
└── System Configuration

================================================================================
ERP SYSTEM MENU BLUEPRINT v1.1
(Updated: Order-to-Cash Cycle)
================================================================================

[INDUK 1] MASTER DATA MANAGEMENT
├── [MENU 1.1] General Setup
│ ├── [SUB MENU 1.1.1] Business Partners
│ │ ├── [SUB SUBMENU] Customer Master
│ │ └── [SUB SUBMENU] Vendor Master
│ └── [SUB MENU 1.1.2] Organization
│ ├── [SUB SUBMENU] Company Structure
│ └── [SUB SUBMENU] Departments
└── [MENU 1.2] Product Management
├── [SUB MENU 1.2.1] Item Setup
│ ├── [SUB SUBMENU] Item Master Data
│ └── [SUB SUBMENU] Units of Measure (UoM)
└── [SUB MENU 1.2.2] Pricing Master
├── [SUB SUBMENU] Standard Price Lists
└── [SUB SUBMENU] Tax Templates

[INDUK 2] SALES & DISTRIBUTION
├── [MENU 2.1] Customer Relationship
│ ├── [SUB MENU 2.1.1] Pre-Sales
│ │ ├── [SUB SUBMENU] Leads Management
│ │ └── [SUB SUBMENU] Opportunities
│ └── [SUB MENU 2.1.2] Activity Tracking
│ ├── [SUB SUBMENU] Customer Meetings
│ └── [SUB SUBMENU] Call Logs
└── [MENU 2.2] Sales Operations
├── [SUB MENU 2.2.1] Order Processing
│ ├── [SUB SUBMENU] Sales Quotations
│ └── [SUB SUBMENU] Sales Orders (SO)
└── [SUB MENU 2.2.2] Fulfillment & Shipping
├── [SUB SUBMENU] Packing Lists (PL) <--- [DITAMBAHKAN DI SINI]
├── [SUB SUBMENU] Delivery Orders (DO)
└── [SUB SUBMENU] Customer Returns

[INDUK 3] PROCUREMENT & INVENTORY
├── [MENU 3.1] Purchasing Operations
│ ├── [SUB MENU 3.1.1] Requisition & Ordering
│ │ ├── [SUB SUBMENU] Purchase Requisitions (PR)
│ │ └── [SUB SUBMENU] Purchase Orders (PO)
│ └── [SUB MENU 3.1.2] Receiving
│ ├── [SUB SUBMENU] Goods Receipt Notes (GRN)
│ └── [SUB SUBMENU] Purchase Returns
└── [MENU 3.2] Warehouse Operations
├── [SUB MENU 3.2.1] Outbound & Inbound Logistics
│ ├── [SUB SUBMENU] Goods Receipts (Inbound)
│ └── [SUB SUBMENU] Picking & Packing (Outbound) <--- [SINKRONISASI WMS]
├── [SUB MENU 3.2.2] Stock Movements
│ ├── [SUB SUBMENU] Internal Transfers
│ └── [SUB SUBMENU] Stock Opname (Physical)
└── [SUB MENU 3.2.3] Warehouse Configuration
├── [SUB SUBMENU] Locations Setup
└── [SUB SUBMENU] Putaway Rules

[INDUK 4] FINANCE & ACCOUNTING
├── [MENU 4.1] General Accounting
│ ├── [SUB MENU 4.1.1] General Ledger
│ │ ├── [SUB SUBMENU] Chart of Accounts (CoA)
│ │ └── [SUB SUBMENU] Journal Entries
│ └── [SUB MENU 4.1.2] Bank & Cash
│ ├── [SUB SUBMENU] Bank Statements
│ └── [SUB SUBMENU] Cash Registers
├── [MENU 4.2] Payables & Receivables
│ ├── [SUB MENU 4.2.1] Accounts Payable (AP)
│ │ ├── [SUB SUBMENU] Vendor Invoices
│ │ └── [SUB SUBMENU] Outgoing Payments
│ └── [SUB MENU 4.2.2] Accounts Receivable (AR)
│ ├── [SUB SUBMENU] Customer Invoices
│ └── [SUB SUBMENU] Incoming Payments
└── [MENU 4.3] Financial Reporting
└── [SUB MENU 4.3.1] Statements
├── [SUB SUBMENU] Balance Sheet
└── [SUB SUBMENU] Profit & Loss

[INDUK 5] HUMAN CAPITAL MANAGEMENT
├── [MENU 5.1] Personnel Administration
│ ├── [SUB MENU 5.1.1] Employee Management
│ │ ├── [SUB SUBMENU] Employee Directory
│ │ └── [SUB SUBMENU] Employment Contracts
│ └── [SUB MENU 5.1.2] Recruitment
│ ├── [SUB SUBMENU] Job Positions
│ └── [SUB SUBMENU] Applicant Tracking
└── [MENU 5.2] Time & Payroll
├── [SUB MENU 5.2.1] Attendance & Leave
│ ├── [SUB SUBMENU] Attendance Logs
│ └── [SUB SUBMENU] Leave Requests
└── [SUB MENU 5.2.2] Payroll Operations
├── [SUB SUBMENU] Salary Structures
└── [SUB SUBMENU] Employee Payslips

[INDUK 6] SYSTEM ADMINISTRATION
├── [MENU 6.1] Security & Access
│ ├── [SUB MENU 6.1.1] User Management
│ │ ├── [SUB SUBMENU] System Users
│ │ └── [SUB SUBMENU] Roles & Permissions
│ └── [SUB MENU 6.1.2] Audit Trail
│ ├── [SUB SUBMENU] Activity Logs
│ └── [SUB SUBMENU] Login History
└── [MENU 6.2] Technical Configuration
├── [SUB MENU 6.2.1] System Settings
│ ├── [SUB SUBMENU] Document Numbering
│ └── [SUB SUBMENU] Scheduled Actions
└── [SUB MENU 6.2.2] Master Defaults
├── [SUB SUBMENU] Currencies
└── [SUB SUBMENU] Exchange Rates

================================================================================
