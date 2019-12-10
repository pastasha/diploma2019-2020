<template lang="pug">
    #app
        .card(v-for="object in objects")
            .card-header
                button.btn.btn-clear.float-right(@click="")
                .card-title {{ object.title }}
                .card-subtitle {{}}
            .card-body {{ object.body }}
</template>
<script>
    import { mapGetters } from 'vuex'
    export default {
        name: 'object-list',
        computed: mapGetters(['objects']),
        methods: {
            deleteObject (object) {
                // Вызываем действие `deleteObject` из нашего хранилища, которое
                // попытается удалить заметку из нашех базы данных, отправив запрос к API
                this.$store.dispatch('deleteObject', object)
            }
        },
        beforeMount () {
            // Перед тем как загрузить страницу, нам нужно получить список всех
            // имеющихся заметок. Для этого мы вызываем действие `getObjects` из
            // нашего хранилища
            this.$store.dispatch('getObjects')
        }
    }
</script>
<style>
    header {
        margin-top: 50px;
    }
</style>