# Event Source 
Various components in an [Event Streaming Platform](../event-stream/event-streaming-platform.md) will generate [Events](../event/event.md). An Event Source is the generalization of these components, and can include databases, [Event Processing Applications](../event-processing/event-processing-application.md), and web services. 

## Problem
How can I record and distribute events generated by my application?

## Solution
![event-source](../img/event-source.png)

## Implementation
[ksqlDB](https://ksqldb.io/) provides a builtin `INSERT` syntax to directly write new Events directly to the [Event Stream](../event-stream/event-stream.md).
```
INSERT INTO foo (ROWTIME, KEY_COL, COL_A) VALUES (1510923225000, 'key', 'A');
```

## References
* [ksqlDB](https://ksqldb.io/) The event streaming database purpose-built for stream processing applications.
