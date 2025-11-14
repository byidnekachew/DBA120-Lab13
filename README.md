# DBA120-Lab13

## Which commands caused errors, and why?
The update command in question 3 caused an error because the view that was created is marked as read only.

## Why are DML operations restricted in some views?
DML operations are restricted in read only views because they are set specifically not to be edited. They may also be restricted if a view has non-key preserved tables.

## How is a materialized view different from a regular view?
A materialized view is the same as a regular view except there's an actual space in memory dedicated to the created view.
