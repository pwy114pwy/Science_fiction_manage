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
              添加图书<el-icon class="el-icon--right">
                <Upload />
              </el-icon>
            </el-button>
          </el-col>
        </el-row>

      </el-header>
      <el-main>
        <el-table :data="filterTableData" style="width: 100%">
          <el-table-column type="index" />
          <el-table-column>
            <template #default="{ row }">
              <!-- {{ row }} -->

              <img :src="row.Img_Url" style="width: 50px;" alt="">
              <!-- <img :src="../../static/" alt=""> -->
              {{ }}
            </template>
          </el-table-column>
          <el-table-column label="书名" prop="Book_Name" />
          <el-table-column align="right">
            <template #header>
              <el-input v-model="search" size="small" placeholder="Type to search" />
            </template>
            <template #default="scope">
              <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                Edit
              </el-button>
              <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">
                Delete
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
    <el-drawer v-model="drawer2" :direction="direction">
      <template #default>
        <el-form :model="form" style="max-width: 600px">
          <el-form-item label="图书名:">
            <el-input v-model="form.name" />
          </el-form-item>
          
          <el-form-item label="标签">
            <el-select v-model="form.region" placeholder="please select your zone">
              <el-option label="Zone one" value="shanghai" />
              <el-option label="Zone two" value="beijing" />
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">Create</el-button>
            <el-button>Cancel</el-button>
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <div style="flex: auto">
          <el-button @click="cancelClick">cancel</el-button>
          <el-button type="primary" @click="confirmClick">confirm</el-button>
        </div>
      </template>
    </el-drawer>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed,reactive } from 'vue';
import { getBooks } from '@/api/getBooks';
import { ElMessageBox, DrawerProps } from 'element-plus'


//图书列表
const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.Book_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  console.log(index, row)
}
const handleDelete = (index: number, row) => {
  console.log(index, row)
}

//获取数据
const tableData = ref([])
onMounted(async () => {
  // console.log(1);
  let res = await getBooks()
  tableData.value = res
  console.log(res);
})

//抽屉
const drawer2 = ref(false)
const direction = ref<DrawerProps['direction']>('rtl')
const radio1 = ref('Option 1')
function cancelClick() {
  drawer2.value = false
}
function confirmClick() {
  ElMessageBox.confirm(`Are you confirm to chose ${radio1.value} ?`)
    .then(() => {
      drawer2.value = false
    })
    .catch(() => {
      // catch error
    })
}

//表单
const form = reactive({
  Book_Name: '',
  region: '',
  date1: '',
  date2: '',
  delivery: false,
  type: [],
  resource: '',
  desc: '',
})

const onSubmit = () => {
  console.log('submit!')
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
</style>
