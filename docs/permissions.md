The types of permissions required to perform actions on the server.

Each request to the server contains the user making the request, as well
as a node ID that the user is acting on behalf of. Based on the state of
the user/node and the action being performed, access to the action may be
permitted/denied based on any of the following criteria.

## AllowNone

Access to this action is never permitted under any circumstance.

## IsAdminUser

Can only perform the action if the user has the `is_staff` flag.

## IsAuthenticated

Can only perform the action if a registered user is making the request.

## IsMember

For objects on the server that are owned by a particular team, actions
against those objects can only be performed by members of the team.

## IsNode

Can only perform the action if acting on behalf of a registered node.

## IsOwnMembership

Only the user to which a team membership pertains can perform the action
against that membership.

## IsPublic

For objects on the server which can be flagged as publicly available, actions
against those objects which are flagged as such can be performed by anyone.

## IsSelf

Users can retrieve their own user records.

## JobIsWorkable

The action can only be performed against a job if it is not a meta-job.

## MemberHasAdminPermission

For objects on the server that are owned by a particular team, actions
against those objects can only be performed by members of the team who
hold admin-level permissions.

## MemberHasExecutePermission

For objects on the server that are owned by a particular team, actions
against those objects can only be performed by members of the team who
hold execute-level permissions.

## MemberHasWritePermission

For objects on the server that are owned by a particular team, actions
against those objects can only be performed by members of the team who
hold write-level permissions.

## NodeIsSelf

Actions on a node can be performed by a user acting on behalf of that node.

## NodeOwnsJob

Actions on a job can be performed by nodes that have acquired a lock on the
job.

## NodeWorkingJob

Actions on a job can be performed by nodes that are/were executing a job. This
is for the case where a node goes offline while performing a job, and while it
is offline the job is wrested away from it. When the node comes back, it can
perform clean-up actions (that hold this permission) around the job it was
working on.
