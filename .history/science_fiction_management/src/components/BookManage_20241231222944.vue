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
          <el-table-column label="标签" prop="Tag" />
          <el-table-column label="主题" prop="Topic" />
          <el-table-column label="作者" prop="Author" />
          <el-table-column label="评分" prop="Rating" />
          <el-table-column #default="{ row }" label="简介">
            {{ row.Book_Introduce.slice(0, 30) }}...
          </el-table-column>
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
          <!-- 图书名 -->
          <el-form-item label="书籍名称:">
            <el-input v-model="form.Book_Name" />
          </el-form-item>
          <!-- 标签 -->
          <el-form-item label="书籍标签:">
            <el-checkbox-group v-model="form.Tag">
              <el-checkbox value="classic" name="type">
                经典
              </el-checkbox>
              <el-checkbox value="hot" name="type">
                热门
              </el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <!-- 主题 -->
          <el-form-item label="书籍主题：">
            <el-input-tag v-model="form.Topic" placeholder="Please input"
              aria-label="Please click the Enter key after input" />
            {{ form }}

          </el-form-item>
          <!-- 作者 -->
          <el-form-item label="作者名称:">
            <el-input v-model="form.Author" />
          </el-form-item>
          <el-form-item label="书籍评分:">
            <div class="demo-rate-block">
              <el-rate v-model="form.value_rating" :colors="colors" />
            </div>
          </el-form-item>
          <el-form-item label="书籍简介">
            <el-input v-model="form.desc" type="textarea" />
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
import { onMounted, ref, computed, reactive } from 'vue';
import { getBooks } from '@/api/getBooks';
import { ElMessageBox, DrawerProps } from 'element-plus'


//评分颜色
const colors = ref(['#99A9BF', '#F7BA2A', '#FF9900'])

//主题输入
// const input_Topic = ref<string[]>()

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
  Tag: [],
  Topic: [],
  Author: '',
  value_rating: 0,
  book
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
