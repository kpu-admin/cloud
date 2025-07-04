<script setup lang="ts">
import { ref, unref } from 'vue';

import { Button, Tooltip } from 'ant-design-vue';

import { ActionEnum } from '@/enums/commonEnum';

import Edit from './modules/edit.vue';
import Tree from './modules/tree.vue';

const editRef = ref<any>(null);
const treeRef = ref<any>(null);

function getEditRef() {
  return unref(editRef);
}
function getTreeRef() {
  return unref(treeRef);
}

// 选中树的节点
function handleTreeSelect(parent = {}, record = {}) {
  getEditRef().setData({ type: ActionEnum.VIEW, parent, record });
}

// 编辑
function handleTreeEdit(parent = {}, record = {}) {
  getEditRef().setData({ type: ActionEnum.EDIT, parent, record });
}

// 点击树的新增按钮
function handleTreeAdd(parent = {}, record = {}) {
  getEditRef().setData({
    type: ActionEnum.ADD,
    parent,
    record: {
      ...record,
    },
  });
}

function handleEditSuccess() {
  getTreeRef().fetch();
}
</script>

<template>
  <KaLayoutContainer left-side-width="30%" >
    <template #leftSide >
      <div class="border-border bg-card mr-2 h-full rounded-[var(--radius)] border p-2" >
        <Tree
          ref="treeRef"
          @select="handleTreeSelect"
          @add="handleTreeAdd"
          @edit="handleTreeEdit"
        />
      </div>
    </template>
    <Edit ref="editRef" @success="handleEditSuccess" />
  </KaLayoutContainer>
</template>
