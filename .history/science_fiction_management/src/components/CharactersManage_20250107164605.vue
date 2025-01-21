<template>
  <el-container>
    <el-header>
      <el-row :gutter="20">
        <el-col :span="21">
          <div class="grid-content ep-bg-purple" />
        </el-col>
        <el-col :span="3">
          <el-button @click="add_btn" type="primary">
            添加角色<el-icon class="el-icon--right">
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

            <img :src="row.Role_Image" style="width: 50px;" alt="">

          </template>
        </el-table-column>
        <el-table-column label="图鉴名称" prop="Illustrated_Name" />
        <el-table-column label="角色名称" prop="Role_Name" />
        <el-table-column #default="{ row }" label="角色简介">
          {{ row.Role_Introduction ? row.Role_Introduction.slice(0, 30) : "..." }}...
        </el-table-column>
        <el-table-column label="角色标签" prop="Tag" />
        <el-table-column #default="{ row }" label="角色语录">
          {{ row.Classic_Quotes ? row.Classic_Quotes.slice(0, 30) : "..." }}...
        </el-table-column>
        <!-- <el-table-column label="角色经历" prop="ContributeList" /> -->
        <el-table-column #default="{ row }" label="角色经历">
          {{ row.ContributeList ? row.ContributeList.join("").slice(0, 30) : "..." }}...
        </el-table-column>
        <el-table-column #default="{ row }" label="角色能力">
          <span v-show="row.AbilityList[0].value" v-for="(item,index) in row.AbilityList">{{item.key}}：{{ item.value }}</span>...
          <!-- <span  v-for="(item,index) in row.AbilityList">{{item.key}}：{{ item.value }}</span>... -->
        </el-table-column>
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
        <!-- 图鉴名 -->
        <el-form-item label="图鉴名称:">
          <el-input v-model="form.Illustrated_Name" />
        </el-form-item>
        <!-- 角色名 -->
        <el-form-item label="角色名称:">
          <el-input v-model="form.Role_Name" />
        </el-form-item>
        <!-- 标签 -->
        <el-form-item label="角色标签:">
          <el-input-tag v-model="form.TagList" placeholder="Please input"
            aria-label="Please click the Enter key after input" />
          <!-- {{ form }} -->

        </el-form-item>

        <!-- 经历 -->
        <!-- <el-form-item label="角色经历：">
          <el-input-tag v-model="form.ContributeList" placeholder="Please input"
            aria-label="Please click the Enter key after input" />
        </el-form-item> -->
        <el-table :data="form.ContributeList" border stripe>
          <el-table-column label="角色经历:">
            <template #default="{ row }">
              {{row?row.slice(0, 30):"..." }}
              <el-button type="primary" size="default" @click="contribute_btn(row)">编辑</el-button>

            </template>
            <!-- <el-input v-model="form.Role_Name" /> -->
          </el-table-column>
        </el-table>

        <!-- 能力 -->
        <el-form-item  label="角色能力：">
            <p style="display: flex;" v-for="(item, index) in form.AbilityList">
              <span>{{ item.key }}</span>:
              <el-input style="width: 120px;" v-model="item.value" placeholder=""  clearable />
            </p>
        </el-form-item>
        <!-- 关系图位置 -->
        <el-form-item  label="关系图位置：">
              <span style="display: flex;">横坐标：<el-input style="width: 120px;" v-model="form.X_Position"></el-input></span>
              <span>纵坐标：<el-input style="width: 120px;" v-model="form.Y_Position"></el-input></span>
        </el-form-item>

        <el-form-item label="角色图片:">
          <el-upload class="avatar-uploader" action="http://127.0.0.1:3000/api/upload_character" :show-file-list="false"
            :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
            <img style="width: 100px;" v-if="Role_Image" :src="Role_Image" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon">
              <Plus />
            </el-icon>
          </el-upload>
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
  <!-- 弹窗 -->
  <el-dialog v-model="dialogVisible" title="" width="400">
    <el-input v-model="dialogContent" style="width: 100%" :rows="10" type="textarea" placeholder="Please input" />
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="confirm_contribute_Edit">
          Confirm
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getCharacters } from "@/api/getCharacters"
import { addCharacter } from "@/api/addCharacter"
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
const props = defineProps(["Illustrated_ID", "Book_Name"])
let dialogVisible = ref(false)
let dialogContent_org = ref("")
let dialogContent = ref("")
let Edit_contribute = ref("")

function add_btn(){
  drawer2.value=true
  form.Character_ID=Il
}

// 定义一个函数用于刷新角色列表
const refreshCharacterList = async () => {
  let res = await getCharacters({ Illustrated_ID: props.Illustrated_ID });
  getdata(res)
}
function contribute_btn(row) {
  dialogVisible.value = true
  dialogContent.value = row
  dialogContent_org.value = row
}
function confirm_contribute_Edit() {
  dialogVisible.value = false
  for (const key in form.ContributeList) {
    if(form.ContributeList[key]==dialogContent_org.value){
      form.ContributeList[key]=dialogContent.value
    }
  }
}


//书籍图片
const Role_Image = ref('')

//上传图片
const handleAvatarSuccess: UploadProps['onSuccess'] = (
  response,
  uploadFile
) => {
  Role_Image.value = URL.createObjectURL(uploadFile.raw!)
}

const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
  if (rawFile.type !== 'image/jpeg') {
    ElMessage.error('Avatar picture must be JPG format!');
    return false;
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('Avatar picture size can not exceed 2MB!');
    return false;
  }

  // 创建一个新的文件对象，使用 form.Book_Name 作为文件名
  const newFile = new File([rawFile], `${form.Role_Name}.jpg`, { type: rawFile.type });

  // 更新 imageUrl 为新的文件对象创建的对象 URL（仅用于预览）
  Role_Image.value = URL.createObjectURL(newFile);

  // 输出日志以检查文件名是否已正确设置
  // console.log('Setting file name to:', newFile.name);
  form.Role_Image = `../../static/books_img/${form.Role_Name}.jpg`
  // 返回新的文件对象，以便上传时使用
  return newFile;
};

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
  // 将当前行的数据赋值给form
  Object.assign(form, { ...row });
  // 如果有图片URL，则更新imageUrl以预览图片
  if (row.Role_Image) {
    Role_Image.value = row.Role_Image;
  }
  // 确保ID也被复制过来
  form.Character_ID = row.Character_ID; // 假设你的图书对象有一个id属性标识它是否是一个已有记录
  // 打开抽屉
  drawer2.value = true;
};
const handleDelete = async (index: number, row) => {
  // console.log(index, row)
  // let res = await delBooks(row)
  // if (res.success) {
  //   ElMessage({
  //     message: res.message,
  //     type: 'success',
  //   })
  //   await refreshBooksList()
  // }
  // console.log(res);

}

//获取数据
const tableData = ref([])
const tableData_org = ref([])
function getdata(response){
  tableData.value = response
  tableData_org.value = response
  for (const element of tableData.value) {
    let arr = []
    for (const key in element) {
      if (key.includes('Contribute')) {
        arr.push(element[key])
      }
    }
    element['ContributeList'] = arr
  }
  for (const element of tableData.value) {
    let arr = []
    for (const key in element) {
      if (key.includes('Ability')) {
        switch (key) {
          case "Power_Ability":
            // arr.push({ "战斗力": element[key] })
            arr.push({ key: "战斗力",value:element[key] })
            break;
          case "Intellect_Ability":
            // arr.push({ "智慧": element[key] })
            arr.push({ key: "智慧",value:element[key] })
            break;
          case "Decision_Ability":
            
            // arr.push({ "决策": element[key] })
            arr.push({ key: "决策",value:element[key] })
            break;
          case "Influence_Ability":
            // arr.push({ "影响力": element[key] })
            arr.push({ key: "影响力",value:element[key] })
            break;
          case "Moral_Ability":
            // arr.push({ "道德": element[key] })
            arr.push({ key: "道德",value:element[key] })
            break;
          case "Will_Ability":
            // arr.push({ "意志": element[key] })
            arr.push({ key: "意志",value:element[key] })
            break;
          default:
            break;
        }
      }
    }
    element['AbilityList'] = arr
  }
  for (const element of tableData.value) {
    if (element.Tag) {
      element['TagList'] = element.Tag.split(',')
    } else {
      element['TagList'] = []
    }
  }
}
onMounted(async () => {
  let response = await getCharacters({ Illustrated_ID: props.Illustrated_ID })
  // tableData.value = response
  // tableData_org.value = response
  // for (const element of tableData.value) {
  //   let arr = []
  //   for (const key in element) {
  //     if (key.includes('Contribute')) {
  //       arr.push(element[key])
  //     }
  //   }
  //   element['ContributeList'] = arr
  // }
  // for (const element of tableData.value) {
  //   let arr = []
  //   for (const key in element) {
  //     if (key.includes('Ability')) {
  //       switch (key) {
  //         case "Power_Ability":
  //           // arr.push({ "战斗力": element[key] })
  //           arr.push({ key: "战斗力",value:element[key] })
  //           break;
  //         case "Intellect_Ability":
  //           // arr.push({ "智慧": element[key] })
  //           arr.push({ key: "智慧",value:element[key] })
  //           break;
  //         case "Decision_Ability":
            
  //           // arr.push({ "决策": element[key] })
  //           arr.push({ key: "决策",value:element[key] })
  //           break;
  //         case "Influence_Ability":
  //           // arr.push({ "影响力": element[key] })
  //           arr.push({ key: "影响力",value:element[key] })
  //           break;
  //         case "Moral_Ability":
  //           // arr.push({ "道德": element[key] })
  //           arr.push({ key: "道德",value:element[key] })
  //           break;
  //         case "Will_Ability":
  //           // arr.push({ "意志": element[key] })
  //           arr.push({ key: "意志",value:element[key] })
  //           break;
  //         default:
  //           break;
  //       }
  //     }
  //   }
  //   element['AbilityList'] = arr
  // }
  // for (const element of tableData.value) {
  //   if (element.Tag) {
  //     element['TagList'] = element.Tag.split(',')
  //   } else {
  //     element['TagList'] = []
  //   }
  // }
  getdata(response)


  console.log(tableData.value);

})
//抽屉
const drawer2 = ref(false)
const direction = ref<DrawerProps['direction']>('rtl')
const radio1 = ref('Option 1')
//监视抽屉的展开情况
watch(drawer2, (newval, oldval) => {
  if (newval == false) {
    cancelClick()
  }
})
function cancelClick() {
  // 清除表单数据
  Object.assign(form, {
    Character_ID: "",
    Illustrated_ID: "",
    Illustrated_Name: "",
    Role_Name: "",
    Role_Introduction: "",
    Role_Image: "",
    Tag: "",
    TagList: [],
    Classic_Quotes: "",
    ContributeList: [],
    AbilityList: [],
    X_Position:"",
    Y_Position:"",
  });
  // tableData.value=tableData_org.value

  Role_Image.value = '';
  drawer2.value = false;
  refreshCharacterList()
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
  Character_ID: "",
  Illustrated_ID: "",
  Illustrated_Name: "",
  Role_Name: "",
  Role_Introduction: "",
  Role_Image: "",
  Tag: "",
  TagList: [],
  Classic_Quotes: "",
  ContributeList: [],
  AbilityList: [],
  X_Position:"",
  Y_Position:"",
})

const onSubmit = async () => {
  // form.Tag = form.TagArr.join(" ")
  // form.Topic = form.TopicArr.join(" ")
  let res = await addCharacter(form)
  console.log(res);

  if (res.success) {
    ElMessage({
      message: res.message,
      type: 'success',
    })
    drawer2.value = false
    await refreshCharacterList()
  }
  // console.log(res);
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
