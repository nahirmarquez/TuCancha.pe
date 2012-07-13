require 'test_helper'

class EspacioDeportivosControllerTest < ActionController::TestCase
  setup do
    @espacio_deportivo = espacio_deportivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:espacio_deportivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create espacio_deportivo" do
    assert_difference('EspacioDeportivo.count') do
      post :create, espacio_deportivo: { capacidad: @espacio_deportivo.capacidad, costo: @espacio_deportivo.costo, descripcion: @espacio_deportivo.descripcion, local_deportivo_id: @espacio_deportivo.local_deportivo_id, nombre: @espacio_deportivo.nombre }
    end

    assert_redirected_to espacio_deportivo_path(assigns(:espacio_deportivo))
  end

  test "should show espacio_deportivo" do
    get :show, id: @espacio_deportivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @espacio_deportivo
    assert_response :success
  end

  test "should update espacio_deportivo" do
    put :update, id: @espacio_deportivo, espacio_deportivo: { capacidad: @espacio_deportivo.capacidad, costo: @espacio_deportivo.costo, descripcion: @espacio_deportivo.descripcion, local_deportivo_id: @espacio_deportivo.local_deportivo_id, nombre: @espacio_deportivo.nombre }
    assert_redirected_to espacio_deportivo_path(assigns(:espacio_deportivo))
  end

  test "should destroy espacio_deportivo" do
    assert_difference('EspacioDeportivo.count', -1) do
      delete :destroy, id: @espacio_deportivo
    end

    assert_redirected_to espacio_deportivos_path
  end
end
