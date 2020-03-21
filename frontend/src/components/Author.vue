<template>
    <div class="big-body" id="app">

        <NavItems></NavItems>

        <div class="body">
            <h1>БОГАЙЧУК ЛЮДМИЛА</h1>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import NavItems from "./NavItems";
    export default {
        name: "Author",
        components: {SidePanel, NavItems}
    }
</script>

<style scoped>

</style>