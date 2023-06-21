// RUN: %dxc -T lib_6_8  %s | FileCheck %s

// Duplicate MaxRecords info with matching limits


// CHECK: 28:68: error: Only one of MaxRecords or MaxRecordsSharedWith may be specified to the same parameter.
// CHECK: 29:68: error: Only one of MaxRecords or MaxRecordsSharedWith may be specified to the same parameter.
// CHECK: 30:68: error: Only one of MaxRecords or MaxRecordsSharedWith may be specified to the same parameter.
// CHECK: 31:68: error: Only one of MaxRecords or MaxRecordsSharedWith may be specified to the same parameter.

struct rec0
{
    int i0;
    float f0;
};

struct rec1
{
    float f1;
    int i1;
};

[Shader("node")]
[NodeLaunch("Thread")]
void DuplicateMax1(
  RWThreadNodeInputRecord<rec0> InputyMcInputFace,
  [MaxRecords(5)] NodeOutput<rec1> Output1,
  [MaxRecordsSharedWith(Output1)] [MaxRecords(5)] NodeOutput<rec1> Output2,
  [MaxRecords(5)] [MaxRecordsSharedWith(Output1)] NodeOutput<rec1> Output3,
  [MaxRecordsSharedWith(Output6)] [MaxRecords(7)] NodeOutput<rec1> Output4,
  [MaxRecords(7)] [MaxRecordsSharedWith(Output6)] NodeOutput<rec1> Output5,
  [MaxRecords(7)] NodeOutput<rec1> Output6)
{
}
