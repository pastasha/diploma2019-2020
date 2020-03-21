<template>
    <div class="big-body" id="app">
        <NavItems></NavItems>

        <div class="body">
            <h1>ОБРАТНАЯ СВЯЗЬ</h1>

            <img class="container-for-feedback" src="@/assets/waiting.jpg">
            <div class="feedback">
                <div class="container-for-input">
                    <input class="input-email-and-name" type="text" placeholder="ИМЯ">
                    <input class="input-email-and-name" type="text" placeholder="EMAIL">
                    <textarea class="input-text" type="text" placeholder="ТЕКСТ"></textarea>
                </div>
            </div>

        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import NavItems from "./NavItems";
    export default {
        name: "Feedback",
        components: {SidePanel, NavItems}
    }
</script>

<style scoped>
    input, textarea{
        outline:none;
        padding: 10px;
        border: none;
        font: inherit;
        color: inherit;
        background-color: transparent;
    }

    .input-text{
        background-color: #F1F1F1;
        box-shadow: 0 0 15px #bdbdbd;
        margin-top: 20px;
        width: 100%; /* Ширина поля в процентах */
        height: 180px; /* Высота поля в пикселах */
        resize: none;
    }

    .input-email-and-name{
        width: 100%;
        height: 40px;
        background-color: #F1F1F1;
        box-shadow: 0 0 15px #bdbdbd;
        margin-bottom: 10px;
    }

    .container-for-input{
        position: center;
        height: 300px;
        width: 350px;
        margin-top: 50px;
        margin-left: 200px;
    }

    .feedback{
        position: absolute;
        background-color: white;
        left: 390px;
        top: 170px;
        bottom: 200px;
        height: 400px;
        width: 770px;
    }

    .container-for-feedback{
        position: absolute;
        background-image: url("/frontend/src/assets/waiting.jpg");
        left: 325px;
        top: 120px;
        bottom: 50px;
        height: 500px;
        width: 900px;
        box-shadow: 0 0 20px #bdbdbd;
    }

</style>