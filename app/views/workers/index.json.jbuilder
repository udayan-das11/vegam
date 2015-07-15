json.array!(@workers) do |worker|
  json.extract! worker, :id, :name, :city, :subcity, :peramadd, :phoneno, :email, :service, :contractbasis, :status
  json.url worker_url(worker, format: :json)
end
