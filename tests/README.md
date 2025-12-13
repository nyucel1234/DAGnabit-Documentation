The testthat folder has:
---
Helper helper-fixtures.R to help load correct files safely

Test test-parser-fixtures.R to do sanity checks that cover all the examples 
  - Checks that each table has the needed columns
  - Checks that there are no missing or duplicate IDs
  - Checks that each edges’ from and to is in the nodes table, so no undefined edges
