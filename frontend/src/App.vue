<template lang = "pug">
  #app
      section.container.grid-960
        .columns
          .column.col-2
          .column.col-8.col-md-12
            header.text-center
              h2 Create picture?
            create-obj
            header.text-center
              h2 List of pictures
            object-list
          .column.col-2
</template>

<script>
import  ObjectList from './components/ObjectList'

export default {
  name: 'app',
  components: {
    'object-list': ObjectList
  }
}
</script>

<style>
    @import url(https://fonts.googleapis.com/css?family=Eczar);
    @import url(https://fonts.googleapis.com/css?family=Work+Sans);
    body {
        font-family: "Work Sans", "Segoe UI", "Helvetica Neue", sans-serif;
    }

    h1, h2, h3, h4, h5, h6 {
        font-family: "Eczar", sans-serif;
    }
</style>