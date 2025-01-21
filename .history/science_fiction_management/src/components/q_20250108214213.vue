<template>
ssssssssss
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getEvents } from "@/api/getEvents"
import { addRelationship } from "@/api/addRelationship"
import { delRelationship } from "@/api/deleteRelationship"
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
let $router = useRouter()
const props = defineProps(["Illustrated_ID", "Book_Name"])
// 定义一个函数用于刷新事件列表
const refreshRelationships = async () => {
  let res = await getEvents({ Illustrated_ID: props.Illustrated_ID });
  tableData.value = res;
}


//事件列表
const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.Event_Description.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  // 将当前行的数据赋值给form
  Object.assign(form, { ...row });
  // 确保ID也被复制过来
  form.ImportantEvent_ID = row.ImportantEvent_ID;
  // 打开抽屉
  drawer2.value = true;
};
const handleDelete = async (index: number, row) => {
  // console.log(index, row)
  let res = await delRelationship(row)
  if (res.success) {
    ElMessage({
      message: res.message,
      type: 'success',
    })
    await refreshRelationships()
  }
  // console.log(res);

}

//获取数据
const tableData = ref([])
onMounted(async () => {
  // console.log(1);
  let res = await getEvents({ Illustrated_ID: props.Illustrated_ID })
  tableData.value = res

  console.log(res);
})

//抽屉
const drawer2 = ref(false)
const direction = ref<DrawerProps['direction']>('rtl')
const radio1 = ref('Option 1')
//监视抽屉的展开情况
watch(drawer2, (newval, oldval) => {
  if (newval == false) {
    cancelClick()
  } else {
    form.Illustrated_ID = props.Illustrated_ID
    form.Illustrated_Name = props.Book_Name
  }
})
function cancelClick() {
  // 清除表单数据
  Object.assign(form, {
    ImportantEvent_ID: '',
    Illustrated_ID: "",
    Illustrated_Name: '',
    Event_Time: "",
    Event_Description: "",
    Event_Value: '',
  });
  drawer2.value = false;
}

//表单
const form = reactive({
  ImportantEvent_ID: '',
  Illustrated_ID: "",
  Illustrated_Name: '',
  Event_Time: "",
  Event_Description: "",
  Event_Value: '',
})

const onSubmit = async () => {
  let res = await addRelationship(form)

  if (res.success) {
    ElMessage({
      message: res.message,
      type: 'success',
    })
    drawer2.value = false
    await refreshRelationships()
  }
  console.log(res);
}
</script>
<style lang="scss" scoped>
.el-header,
.el-footer {
  // background-color: #b3c0d1;
  height: 20px;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 20px;

  span {
    font-size: 25px;
  }
}

.el-aside {
  height: 730px;
  background-color: #d3dce6;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 200px;
}

.el-main {
  background-color: #e9eef3;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 160px;
}

body>.el-container {
  margin-bottom: 40px;
}

.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}

//上传按钮
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
