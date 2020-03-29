<template>
    <div class="big-body" id="app">

        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="form-body">
            <h1>ОФОРМЛЕНИЕ ЗАКАЗА</h1>
            <div class="form-container">
                <div class="contact-details-container">
                    <p class="forms-title">Контактные данные</p>
                    <label>
                        <input class="form-input" v-model="full_name" placeholder="Имя и фамилия">
                    </label>
                    <label>
                        <input class="form-input" v-model="country" placeholder="Страна">
                    </label>
                    <label>
                        <input class="form-input" v-model="city" placeholder="Город">
                    </label>
                    <label>
                        <input class="form-input" v-model="telephone_number"
                               placeholder="Телефонный номер">
                    </label>

                    <span>Хочу продолжать общение посредством</span>
                    <div id="keep_in_touch_id" class="keep_in_touch_form">
                        <label for="telegram">
                            <input class="form-radio" type="radio" id="telegram" value="Telegram"
                                   v-model="keep_in_touch" checked>
                            <span class="design"></span>
                            <span class="text">Telegram</span>
                        </label>

                        <input type="radio" id="viber" value="Viber" v-model="keep_in_touch">
                        <label for="viber">Viber</label>

                        <input type="radio" id="telephone" value="Телефона" v-model="keep_in_touch">
                        <label for="telephone">Телефона</label>
                        <br>
                    </div>

                    <label v-if="keep_in_touch==='Telegram'">
                        <input class="form-input" v-model="nickname"
                               placeholder="Никнейм аккаунта">
                    </label>
                </div>

                <div class="way_to_receive_the_package">
                    <p class="forms-title">Способ получения</p>
                    <span>Получить заказ в городе {{ city }}:</span>
                    <div id="receive_id" class="receive_form">
                        <input type="radio" id="NewPost" value="самовывоз из Новой Почты" v-model="receive">
                        <label for="NewPost">самовывоз из Новой Почты</label>
                        <br>
                        <input type="radio" id="UkrPost" value="самовывоз из Укрпочты" v-model="receive">
                        <label for="UkrPost">самовывоз из Укрпочты</label>
                        <br>
                        <input type="radio" id="NewPostCourier" value="курьер Новой Почты" v-model="receive">
                        <label for="NewPostCourier">курьер Новой Почты</label>
                        <br>
                        <input type="radio" id="At the meeting" value="при встрече (только в Одессе)" v-model="receive">
                        <label for="At the meeting">при встрече (только в Одессе)</label>
                        <br>
                    </div>

                    <label>
                        <input class="form-input" v-model="post_office" placeholder="Почтовое отделение"
                               v-if="receive === 'самовывоз из Новой Почты' || receive === 'самовывоз из Укрпочты'">
                    </label>

                    <label>
                        <input class="form-input" v-model="address" placeholder="Адрес"
                               v-if="receive === 'курьер Новой Почты'">
                    </label>
                </div>

                <div class="payment_method">
                    <p class="forms-title">Способ оплаты</p>
                    <div id="payment" class="keep_in_touch_form">
                        <input type="radio" id="upon receipt" value="Оплатить заказ при получении" v-model="payment">
                        <label for="upon receipt">Оплатить заказ при получении</label>
                        <br>
                        <input type="radio" id="transfer to card" value="Перевод на карту" v-model="payment">
                        <label for="transfer to card">Перевод на карту</label>
                        <br>
                    </div>
                    <br>
                </div>

                <div class="comment">
                    <p class="forms-title">Комментарий</p>
                    <textarea class="input-text" v-model="comment" placeholder="Укажите дополнительную информацию"></textarea>
                    <br>
                </div>

                <router-link :to = "{
                                  name: 'Verification',
                                  params: {
                                        full_name: full_name,
                                        country: country,
                                        city: city,
                                        telephone_number: telephone_number,
                                        nickname: nickname,
                                        keep_in_touch: keep_in_touch,
                                        receive: receive,
                                        post_office: post_office,
                                        address: address,
                                        payment: payment,
                                        total_amount: $route.params.price,
                                        comment: comment,
                                        picture: $route.params.picture
                                  }
                                }">

                    <button class="checkout-button">ОФОРМИТЬ ЗАКАЗ</button>
                </router-link>

            </div>
            <div class="order">
                <figure>
                    <p><img class="preview-picture-form"
                            v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)"
                            :alt="$route.params.preview"></p>
                    <figcaption>{{$route.params.title}}</figcaption>
                    <button class="picture-state-form">{{ $route.params.price }}$</button>
                </figure>
            </div>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";

    export default {
        name: "Checkout",
        components: {SidePanel},
        data() {
            return {
                full_name: '',
                country: '',
                city: '',
                telephone_number: '',
                nickname: '',
                keep_in_touch: '',
                receive: '',
                post_office: '',
                address: '',
                payment: '',
                comment: ''
            }
        },
    }
</script>

<style>
    .picture-state-form{
        background-color: #F1F1F1;
        height: 40px;
        width: 230px;
        margin-top: 10px;
        box-shadow: 0 0 6px #D1D1D1;
        padding: 0;
        border: none;
        font: 16pt Yu Gothic UI;
        color: #707070;
    }

    figcaption{
        font: normal 20pt Yu Gothic UI;
        margin-top: -20px;
        text-transform: uppercase;
        color: #707070;
    }

    figure{
        margin: 0;
        padding: 0;
        text-align: center;
    }

    .preview-picture-form{
        border: solid 10px white;
        margin: 0;
        width: 316px;
    }

    .order{
        position: relative;
        display: inline-block;
        top: -498px;
        margin-left: 30px;
        margin-bottom: 30px;
        padding-bottom: 20px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;;
    }

    .checkout-button{
        text-transform: uppercase;
        width: 100%;
        background-color: #ccfed9;
        height: 50px;
        margin-bottom: 60px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 15pt Yu Gothic UI;
        color: #7EBB97;
    }

    .comment{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
    }

    .payment_method{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid chartreuse 1px;
    }

    .way_to_receive_the_package{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid aqua 1px;
    }

    .contact-details-container{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid navy 1px;
    }

    .form-container{
        position: relative;
        display: inline-block;
        top: 20%;
        left: 0;
        right: 33%;
        bottom: 0;
    }

    .form-body{
        position: absolute;
        right: 400px;
        left: 300px;
        top: 100px;
        bottom: 50px;
    }

    .forms-title{
        font: lighter 23pt Yu Gothic;
        text-align: center;
        color: #707070;
    }
</style>