Module for creating IAM entities (role, policy, group, user) in a unified style. The module will create:
- a role, with no permissions, which can be assumed by users within the same account,
- a policy, allowing users / entities to assume the above role,
- a group, with the above policy attached,
- a user, belonging to the above group.

All entities will have the same name, prefixed with the provided environment/context, e.g., ctx-entity-role, 
ctx-entity-policy, ctx-entity-group, ctx-entity-user; or just ctx-entity, depending on the suffix toggle.
