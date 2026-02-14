---
inclusion: always
---

# Planning

## Conciseness
- ALL planning documents MUST be concise
- Review after writing: eliminate verbosity, increase precision
- Avoid redundancy

## Task File Limit
- Max 500 lines per task file
- Break into separate feature specs when approaching limit
- Each spec self-contained with requirements, design, tasks

## Decomposition
1. Identify feature boundaries
2. Create master plan with execution order
3. Ensure clear interfaces and dependencies
4. Use steering folder for cross-cutting concerns

## Documentation
- All projects should have thorough documentation
- From a user's perspective, write documentation which explains how the project should be used

## AWS IAM Policies
- All required AWS IAM policies should be documented and/or included.
- You MUST identify all acting parties in a solution and define what permissions those actors require
- All policies MUST be least privileged and MUST NOT include permissions which are not used when executing the code that the actor will run
- If any code should be executed by a user, if it requires any AWS permissions you MUST include in the solution an AWS IAM Policy document as a json file which details all the required permissions for that actor to complete their task.
