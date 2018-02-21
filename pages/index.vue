<template>
  <v-layout>
    <v-flex>
      <v-card></v-card>
      <v-card>
        <TitleBar title="Order of Service"/>
        <DraggableList :items="items"/>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import DraggableList from '../components/DraggableList/Index'
import TitleBar from '../components/TitleBar'

export default {
  components: {
    DraggableList,
    TitleBar
  },
  data () {
    return {
      items: [
        { title: 'Preservice Loop' },
        { title: 'Call to Worship' },
        { title: 'All Creatures of Our God and King', subtitle: 'Some details' }
      ]
    }
  }
}
</script>
