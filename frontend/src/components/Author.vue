<template>
    <div class="main-body" id="app">

        <NavItems></NavItems>

        <div class="author-body">
            <div class="beauty-line">
                <h1>БОГАЙЧУК ЛЮДМИЛА</h1>
                <img src="@/assets/author-photo.jpg">
            </div>
            <div class="content-container">
                <p>Доторкнутись до небес. Асоціативно закодувати ідею. Мене завжди захоплює момент самого процесу творення, очікування , що я побачу на виході. Від зародження ідеї до її втілення кожен етап несе радість творення. Цей момент радості дає захоплення і надихає на життя в повному сенсі.
                    В техніці батика я бачу можливість організувати систему знаків на площині. Батик дає можливість виражатись лаконічно, цілісно; Сітка тріщин надає композиціям первісності часу, відстороненості від реалій. Викликає з підсвідомості цлий світ,такий далекий і в той же час такий близький.
                </p>
                <p>
                    Народилась на Херсонщині 8 січня 1971р. 1988-1993рр. навчання на ХГФ ОДПІ ім. К.Д. Ушинського. Викладачі: Лозовський С.В, Саколюк В.М. , Желтомирська Н.Є. З 1995 року працює викладачем на ХГФ, кафедра ДПМ та МХН, дизайну.  Майстерня розпису тканин, батик. З 2010 року Богайчук Л.Р. член  НСХУ м. Одеси. З 1995 року постійно бере участь у  регіональних, Всеукраїнських, Міжнародних виставках. Постійно працює над собою, розвиває себе, як художник батиковщик. Займається художнім оформленням дитячих книг.
                </p>
            </div>
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

<style>
    .author-body{
        position: absolute;
        left: 0;
        right: 0;
        top: 180px;
        bottom: 0;
    }

    .beauty-line{
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        background: url(~@/assets/beauty-line.jpg) no-repeat;
        height: 100%;
        width: 100%;
        background-size: 100% auto;
    }

    .beauty-line img{
        position: absolute;
        left: 5%;
        top: 10%;
        height: 400px;
        width: 400px;
        border: solid white 10px;
        box-shadow: 0 0 6px #9b9b9b;
    }

    .beauty-line h1{
        position: absolute;
        top: -12%;
        right: 70px;
    }

    .content-container{
        position: absolute;
        top: 10%;
        right: 70px;
        width: 55%;
        bottom: 7.5%;
        padding: 50px;
        background-color: white;
        box-shadow: 0 0 6px #9b9b9b;
    }

    .content-container p{
        text-align: justify;
        text-indent: 1.5em;
        line-height: 1.6em;
    }
</style>