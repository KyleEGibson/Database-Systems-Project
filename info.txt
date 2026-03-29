
Project Setup Instructions

--------------------------------------------------
SOFTWARE REQUIREMENTS
--------------------------------------------------
- MySQL Server: Version 8.0 or higher
- MySQL Workbench: Latest version
- Operating System: Windows, macOS, or Linux

--------------------------------------------------
FILES INCLUDED
--------------------------------------------------
- CompanyData_clean.csv – Data file
- companydb_backup.sql – Database backup
- Phase1.sql through Phase6.sql
- DBSProj.sql
- Phase3.mwb – ER diagram

--------------------------------------------------
SETUP INSTRUCTIONS
--------------------------------------------------

1. Install MySQL Server & Workbench:
   - https://dev.mysql.com/downloads/

2. Open MySQL Workbench and connect to your MySQL instance.

3. Create and select the database:
   - Right-click the schema > Table Data Import Wizard
   - Select CompanyData_clean.csv and follow prompts

4. Import and run setup scripts in order:
   - DBSProj.sql
   - Phase1.sql
   - Phase2.sql
   - Phase3.sql
   - Phase4.sql
   - Phase5.sql
   - Phase6.sql

5. Optionally restore from backup:
   - Server > Data Import
   - Choose companydb_backup.sql as a self-contained file
   - Import to companydb_backup schema

--------------------------------------------------
BACKUP STORAGE
--------------------------------------------------
- Use companydb_backup.sql for recovery
- Store securely on external drive or on the cloud
