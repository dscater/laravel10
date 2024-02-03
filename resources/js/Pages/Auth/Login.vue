<script>
import Login from "@/Layouts/Login.vue";
export default {
    layout: Login,
};
</script>

<script setup>
import { useForm } from "@inertiajs/vue3";
import { ref } from "vue";

const form = useForm({
    usuario: "",
    password: "",
});

const visible = ref(false);

const submit = () => {
    form.post(route("login"), {
        onFinish: () => form.reset("password"),
    });
};
</script>

<template>
    <v-container class="ma-0">
        <v-row align="center" justify="center">
            <v-col cols="12" sm="8" md="6" xl="6">
                <v-card class="elevation-6 mt-10">
                    <v-row>
                        <v-col cols="12" sm="6" class="pa-0">
                            <v-img
                                class="h-100 w-100"
                                lazy
                                cover
                                src="https://cdn.vuetifyjs.com/images/parallax/material.jpg"
                            ></v-img>
                        </v-col>
                        <v-col cols="12" sm="6" class="border">
                            <form @submit.prevent="submit">
                                <v-card-text class="mt-16">
                                    <h4 class="text-center">NOMBRE EMPRESA</h4>
                                    <h6 class="text-center grey--text">
                                        LOGIN
                                    </h6>
                                    <v-row
                                        align="center"
                                        justify="center"
                                        class="mb-8"
                                    >
                                        <v-col cols="12" sm="10">
                                            <div
                                                class="text-subtitle-1 text-medium-emphasis"
                                            >
                                                Usuario
                                            </div>

                                            <v-text-field
                                                density="compact"
                                                placeholder="Ingresa tu usuario"
                                                prepend-inner-icon="mdi-account"
                                                variant="outlined"
                                                color="blue"
                                                autocomplete="false"
                                                v-model="form.usuario"
                                                autofocus=""
                                            ></v-text-field>

                                            <div
                                                class="text-subtitle-1 text-medium-emphasis d-flex align-center justify-space-between"
                                            >
                                                Contraseña
                                            </div>

                                            <v-text-field
                                                :append-inner-icon="
                                                    visible
                                                        ? 'mdi-eye-off'
                                                        : 'mdi-eye'
                                                "
                                                :type="
                                                    visible
                                                        ? 'text'
                                                        : 'password'
                                                "
                                                density="compact"
                                                placeholder="Ingresa tu contraseña"
                                                prepend-inner-icon="mdi-lock-outline"
                                                variant="outlined"
                                                color="blue"
                                                @click:append-inner="
                                                    visible = !visible
                                                "
                                                autocomplete="false"
                                                v-model="form.password"
                                            ></v-text-field>
                                            <v-btn
                                                color="blue"
                                                dark
                                                block
                                                type="submit"
                                                >ACCEDER</v-btn
                                            >
                                        </v-col>
                                    </v-row>
                                </v-card-text>
                            </form>
                        </v-col>
                    </v-row>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<style scoped>
.v-container {
    background-color: var(--secundario);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    min-width: 100vw;
}
</style>
