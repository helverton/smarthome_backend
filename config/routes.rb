Rails.application.routes.draw do
  scope '/api' do
    scope '/v1', constraints: { format: :json }  do
        resources :logs
        resources :dispositivos
        get  'dispositivos/:dispositivo_id/logs'     => 'dispositivos#logs'
        put  'dispositivos/:dispositivo_id/power' => 'dispositivos#power'
    end
  end
end