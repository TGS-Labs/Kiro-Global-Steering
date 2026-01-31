---
inclusion: always
---

# Testing Standards

## NON-NEGOTIABLE
1. ALL work MUST be tested - no exceptions
2. ALL tests MUST pass before task completion
3. ≥95% code coverage required (statements, branches, functions, lines)
4. NEVER skip, disable, or comment out tests
5. Task is incomplete until tests pass with ≥95% coverage

## Core Requirements

### Test Everything
- Every function, method, and module must have tests
- Test both success paths and error conditions
- Test edge cases and boundary conditions
- Test validation logic thoroughly

### Coverage Standards
- Minimum 95% coverage across all metrics
- Measure statements, branches, functions, and lines
- Use appropriate coverage tools for your language
- No task is complete below 95% threshold

### Test Quality
- Tests must validate actual functionality
- Use descriptive test names that explain behavior
- Keep tests focused and independent
- Avoid brittle tests that break with minor changes

## When Tests Fail
1. Investigate the root cause
2. Fix the code OR fix the test
3. Re-run until all tests pass
4. Never complete a task with failing tests

## When Coverage <95%
1. Identify uncovered code paths
2. Add tests for missing coverage
3. Test edge cases and error handling
4. Achieve ≥95% before marking task complete

## Task Completion Criteria
A task is only complete when:
- All tests pass
- Coverage is ≥95%
- No tests are skipped or disabled
