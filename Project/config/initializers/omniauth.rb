Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '258995174152583', '77346ed3fbeeef65bc4d7e18892854ba', scope: 'email, offline_access'
end