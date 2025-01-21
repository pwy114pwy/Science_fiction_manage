<template>
  <template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="20">
          <el-col :span="21">
            <div class="grid-content ep-bg-purple" />
          </el-col>
          <el-col :span="3">
            <el-button @click="drawer2 = true" type="primary">
              添加关系<el-icon class="el-icon--right">
                <Upload />
              </el-icon>
            </el-button>
          </el-col>
        </el-row>

      </el-header>
      <el-main>
        <el-table :data="filterTableData" style="width: 100%">
          <el-table-column type="index" />
          <el-table-column label="图鉴名称" prop="Illustrated_Name" />
          <el-table-column label="角色1" prop="From_Name" />
          <el-table-column label="角色2" prop="To_Name" />
          <el-table-column label="角色关系" prop="Relation_Type" />
          <el-table-column align="right">
            <template #header>
              <el-input v-model="search" size="small" placeholder="Type to search" />
            </template>
            <template #default="scope">
              <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                编辑
              </el-button>
              <el-popconfirm title="你确定要删除吗?" @confirm="handleDelete(scope.$index, scope.row)">
                <template #reference>
                  <el-button size="small" type="danger">
                    删除
                  </el-button>
                </template>
              </el-popconfirm>

            </template>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
    <!-- 抽屉 -->
    <el-drawer v-model="drawer2" :direction="direction">
      <template #default>
        <el-form :model="form" style="max-width: 600px">
          <!-- 关系名 -->
          <el-form-item label="图鉴名称:">
            <el-input disabled v-model="form.Illustrated_Name" />
          </el-form-item>
          <!-- 角色1 -->
          <el-form-item label="角色1:">
            <el-input v-model="form.From_Name" />
          </el-form-item>
          <!-- 角色2 -->
          <el-form-item label="角色2:">
            <el-input v-model="form.To_Name" />
          </el-form-item>
          <!-- 角色关系 -->
          <el-form-item label="角色关系:">
            <el-input v-model="form.Relation_Type" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">提交</el-button>
            <el-button @click="cancelClick">取消</el-button>
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <div style="flex: auto">
          <!-- <el-button @click="cancelClick">cancel</el-button>
          <el-button type="primary" @click="confirmClick">confirm</el-button> -->
        </div>
      </template>
    </el-drawer>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getRelationships } from "@/api/getRelationships"
import { addRelationship } from "@/api/addRelationship"
import { delRelationship } from "@/api/deleteRelationship"
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
let $router = useRouter()
const props = defineProps(["Illustrated_ID", "Book_Name"])
// 定义一个函数用于刷新关系列表
const refreshRelationships = async () => {
  let res = await getRelationships({ Illustrated_ID: props.Illustrated_ID });
  tableData.value = res;
}


//关系列表
const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.From_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  // 将当前行的数据赋值给form
  Object.assign(form, { ...row });
  // 确保ID也被复制过来
  form.Relationship_ID = row.Relationship_ID; // 假设你的图书对象有一个id属性标识它是否是一个已有记录
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
  let res = await getRelationships({ Illustrated_ID: props.Illustrated_ID })
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
  }else{
    form.Illustrated_ID=props.Illustrated_ID
    form.Illustrated_Name=props.Book_Name
  }
})
function cancelClick() {
  // 清除表单数据
  Object.assign(form, {
    Relationship_ID: '',
    Illustrated_ID: "",
    Illustrated_Name: '',
    From_CharacterID: "",
    From_Name: "",
    To_CharacterID: '',
    To_Name: "",
    Relation_Type: "",
  });
  drawer2.value = false;
}

//表单
const form = reactive({
  Relationship_ID: '',
  Illustrated_ID: "",
  Illustrated_Name: '',
  From_CharacterID: "",
  From_Name: "",
  To_CharacterID: '',
  To_Name: "",
  Relation_Type: "",
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

</template>
<script setup lang="ts">

</script>
<style lang="scss" scoped>

</style>
