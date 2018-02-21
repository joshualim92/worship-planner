<template>
  <div>
    <v-list>
      <Draggable v-model="items">
        <div v-for="(item, index) in items">
          <v-list-tile avatar :key="item.title" @click="">
            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
              <v-list-tile-sub-title v-html="item.subttemplateitle"></v-list-tile-sub-title>
            </v-list-tile-content>
          </v-list-tile>
        </div>
      </Draggable>
      <v-list-tile>
        <v-list-tile-content>
          <v-text-field clearable label="New Item" prepend-icon="add"
            prepend-icon-cb="addToItems"></v-text-field>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </div>
</template>

<script>
import Draggable from 'vuedraggable'

export default {
  components: {
    Draggable
  },
  props: ['items'],
  methods: {
    addToItems () {
      console.log('here mofo')
    }
  }
}
</script>
