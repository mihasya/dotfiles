source ~/.softlayer_secrets
alias sldr="SL_USERNAME=${SL_USERNAME_DR} SL_API_KEY=${SL_API_KEY_DR}"
alias sleuadm="SL_USERNAME=${SL_USERNAME_EU_ADM} SL_API_KEY=${SL_API_KEY_EU_ADM} BM_API_KEY=${BM_API_KEY_EU_ADM} VAULT_TOKEN=${VAULT_TOKEN_EU_ADM}"
# sleu uses non-root IBM and SoftLayer credentials, but must use root vault token because terraform doesn't play nice with user tokens
# see jira/AUTHSEC-121
alias sleu="SL_USERNAME=${SL_USERNAME_EU} SL_API_KEY=${SL_API_KEY_EU} BM_API_KEY=${BM_API_KEY_EU} IC_API_KEY=${BM_API_KEY_EU} VAULT_TOKEN=${VAULT_TOKEN_EU_ADM}"
