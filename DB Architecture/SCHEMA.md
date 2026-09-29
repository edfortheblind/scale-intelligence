# Schema and physical layout

| Object class | Count |
| --- | --- |
| CHECK_CONSTRAINT | 2 |
| DEFAULT_CONSTRAINT | 545 |
| FOREIGN_KEY_CONSTRAINT | 407 |
| PRIMARY_KEY_CONSTRAINT | 400 |
| SEQUENCE_OBJECT | 1 |
| SQL_INLINE_TABLE_VALUED_FUNCTION | 1 |
| SQL_SCALAR_FUNCTION | 66 |
| SQL_STORED_PROCEDURE | 921 |
| SQL_TABLE_VALUED_FUNCTION | 9 |
| SQL_TRIGGER | 6 |
| UNIQUE_CONSTRAINT | 11 |
| USER_TABLE | 518 |
| VIEW | 135 |

All observed user objects belong to dbo. The catalog JSON supplies complete observed columns, keys, constraints, index composition, types, storage and dependencies. [Object index](OBJECT_INDEX.md) links individual dictionaries.

| Logical file | Type | Size pages | Growth | Percent growth |
| --- | --- | --- | --- | --- |
| data_0 | ROWS | 3221808 | 2048 | False |
| log | LOG | 3007488 | 2048 | False |
| XTP | FILESTREAM | 0 | 0 | False |

File size is allocated catalog metadata, not row volume. Physical paths, row samples, histogram values, identity last values and partition row counts were not collected.
