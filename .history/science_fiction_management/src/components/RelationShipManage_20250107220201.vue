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
              添加gu<el-icon class="el-icon--right">
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
              <!-- {{ }} -->
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
          <!-- 图书名 -->
          <el-form-item label="书籍名称:">
            <el-input v-model="form.Book_Name" />
          </el-form-item>
          <!-- 标签 -->
          <el-form-item label="书籍标签:">
            <el-checkbox-group v-model="form.TagArr">
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
            <el-input-tag v-model="form.TopicArr" placeholder="Please input"
              aria-label="Please click the Enter key after input" />
            <!-- {{ form }} -->

          </el-form-item>
          <!-- 作者 -->
          <el-form-item label="作者名称:">
            <el-input v-model="form.Author" />
          </el-form-item>
          <el-form-item label="书籍评分:">
            <div class="demo-rate-block">
              <el-rate v-model.number="form.Rating" :colors="colors" />
            </div>
          </el-form-item>
          <el-form-item label="书籍简介:">
            <el-input v-model="form.Book_Introduce" type="textarea" />
          </el-form-item>
          <el-form-item label="书籍图片:">
            <el-upload class="avatar-uploader" action="http://127.0.0.1:3000/api/upload_bookimg" :show-file-list="false"
              :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
              <img style="width: 100px;" v-if="imageUrl" :src="imageUrl" class="avatar" />
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
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getCharacters } from "@/api/getCharacters"
import { addCharacter } from "@/api/addCharacter"
import { delCharacter } from "@/api/deleteCharacter"
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
let $router=useRouter()
const props = defineProps(["Illustrated_ID", "Book_Name"])
</script>
<style lang="scss" scoped>

</style>
