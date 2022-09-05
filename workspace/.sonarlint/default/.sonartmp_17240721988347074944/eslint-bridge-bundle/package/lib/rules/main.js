"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.rules = void 0;
const anchor_precedence_1 = require("./anchor-precedence");
const argument_type_1 = require("./argument-type");
const arguments_order_1 = require("./arguments-order");
const arguments_usage_1 = require("./arguments-usage");
const array_callback_without_return_1 = require("./array-callback-without-return");
const array_constructor_1 = require("./array-constructor");
const arrow_function_convention_1 = require("./arrow-function-convention");
const assertions_in_tests_1 = require("./assertions-in-tests");
const bitwise_operators_1 = require("./bitwise-operators");
const bool_param_default_1 = require("./bool-param-default");
const call_argument_line_1 = require("./call-argument-line");
const certificate_transparency_1 = require("./certificate-transparency");
const chai_determinate_assertion_1 = require("./chai-determinate-assertion");
const class_name_1 = require("./class-name");
const class_prototype_1 = require("./class-prototype");
const code_eval_1 = require("./code-eval");
const comma_or_logical_or_case_1 = require("./comma-or-logical-or-case");
const comment_regex_1 = require("./comment-regex");
const concise_regex_1 = require("./concise-regex");
const conditional_indentation_1 = require("./conditional-indentation");
const confidential_information_logging_1 = require("./confidential-information-logging");
const constructor_for_side_effects_1 = require("./constructor-for-side-effects");
const content_length_1 = require("./content-length");
const content_security_policy_1 = require("./content-security-policy");
const cookie_no_httponly_1 = require("./cookie-no-httponly");
const cookies_1 = require("./cookies");
const cors_1 = require("./cors");
const csrf_1 = require("./csrf");
const cyclomatic_complexity_1 = require("./cyclomatic-complexity");
const declarations_in_global_scope_1 = require("./declarations-in-global-scope");
const deprecation_1 = require("./deprecation");
const destructuring_assignment_syntax_1 = require("./destructuring-assignment-syntax");
const different_types_comparison_1 = require("./different-types-comparison");
const disabled_auto_escaping_1 = require("./disabled-auto-escaping");
const disabled_resource_integrity_1 = require("./disabled-resource-integrity");
const disabled_timeout_1 = require("./disabled-timeout");
const dns_prefetching_1 = require("./dns-prefetching");
const duplicates_in_character_class_1 = require("./duplicates-in-character-class");
const empty_string_repetition_1 = require("./empty-string-repetition");
const encryption_1 = require("./encryption");
const encryption_secure_mode_1 = require("./encryption-secure-mode");
const existing_groups_1 = require("./existing-groups");
const expression_complexity_1 = require("./expression-complexity");
const file_header_1 = require("./file-header");
const file_name_differ_from_class_1 = require("./file-name-differ-from-class");
const file_permissions_1 = require("./file-permissions");
const file_uploads_1 = require("./file-uploads");
const fixme_tag_1 = require("./fixme-tag");
const for_in_1 = require("./for-in");
const for_loop_increment_sign_1 = require("./for-loop-increment-sign");
const frame_ancestors_1 = require("./frame-ancestors");
const function_inside_loop_1 = require("./function-inside-loop");
const function_name_1 = require("./function-name");
const function_return_type_1 = require("./function-return-type");
const future_reserved_words_1 = require("./future-reserved-words");
const generator_without_yield_1 = require("./generator-without-yield");
const hashing_1 = require("./hashing");
const hidden_files_1 = require("./hidden-files");
const in_operator_type_error_1 = require("./in-operator-type-error");
const inconsistent_function_call_1 = require("./inconsistent-function-call");
const index_of_compare_to_positive_number_1 = require("./index-of-compare-to-positive-number");
const insecure_cookie_1 = require("./insecure-cookie");
const insecure_jwt_token_1 = require("./insecure-jwt-token");
const inverted_assertion_arguments_1 = require("./inverted-assertion-arguments");
const label_position_1 = require("./label-position");
const max_union_size_1 = require("./max-union-size");
const misplaced_loop_counter_1 = require("./misplaced-loop-counter");
const nested_control_flow_1 = require("./nested-control-flow");
const new_operator_misuse_1 = require("./new-operator-misuse");
const no_accessor_field_mismatch_1 = require("./no-accessor-field-mismatch");
const no_alphabetical_sort_1 = require("./no-alphabetical-sort");
const no_angular_bypass_sanitization_1 = require("./no-angular-bypass-sanitization");
const no_array_delete_1 = require("./no-array-delete");
const no_associative_arrays_1 = require("./no-associative-arrays");
const no_built_in_override_1 = require("./no-built-in-override");
const no_case_label_in_switch_1 = require("./no-case-label-in-switch");
const no_clear_text_protocols_1 = require("./no-clear-text-protocols");
const no_code_after_done_1 = require("./no-code-after-done");
const no_commented_code_1 = require("./no-commented-code");
const no_dead_store_1 = require("./no-dead-store");
const no_delete_var_1 = require("./no-delete-var");
const no_duplicate_in_composite_1 = require("./no-duplicate-in-composite");
const no_empty_after_reluctant_1 = require("./no-empty-after-reluctant");
const no_empty_alternatives_1 = require("./no-empty-alternatives");
const no_empty_group_1 = require("./no-empty-group");
const no_equals_in_for_termination_1 = require("./no-equals-in-for-termination");
const no_for_in_iterable_1 = require("./no-for-in-iterable");
const no_function_declaration_in_block_1 = require("./no-function-declaration-in-block");
const no_global_this_1 = require("./no-global-this");
const no_globals_shadowing_1 = require("./no-globals-shadowing");
const no_hardcoded_credentials_1 = require("./no-hardcoded-credentials");
const no_hardcoded_ip_1 = require("./no-hardcoded-ip");
const no_implicit_dependencies_1 = require("./no-implicit-dependencies");
const no_implicit_global_1 = require("./no-implicit-global");
const no_in_misuse_1 = require("./no-in-misuse");
const no_incomplete_assertions_1 = require("./no-incomplete-assertions");
const no_inconsistent_returns_1 = require("./no-inconsistent-returns");
const no_incorrect_string_concat_1 = require("./no-incorrect-string-concat");
const no_infinite_loop_1 = require("./no-infinite-loop");
const no_intrusive_permissions_1 = require("./no-intrusive-permissions");
const no_invalid_await_1 = require("./no-invalid-await");
const no_invariant_returns_1 = require("./no-invariant-returns");
const no_ip_forward_1 = require("./no-ip-forward");
const no_labels_1 = require("./no-labels");
const no_mime_sniff_1 = require("./no-mime-sniff");
const no_misleading_array_reverse_1 = require("./no-misleading-array-reverse");
const no_mixed_content_1 = require("./no-mixed-content");
const no_nested_assignment_1 = require("./no-nested-assignment");
const no_nested_conditional_1 = require("./no-nested-conditional");
const no_nested_incdec_1 = require("./no-nested-incdec");
const no_new_symbol_1 = require("./no-new-symbol");
const no_parameter_reassignment_1 = require("./no-parameter-reassignment");
const no_primitive_wrappers_1 = require("./no-primitive-wrappers");
const no_redundant_assignments_1 = require("./no-redundant-assignments");
const no_redundant_optional_1 = require("./no-redundant-optional");
const no_redundant_parentheses_1 = require("./no-redundant-parentheses");
const no_reference_error_1 = require("./no-reference-error");
const no_referrer_policy_1 = require("./no-referrer-policy");
const no_require_or_define_1 = require("./no-require-or-define");
const no_return_type_any_1 = require("./no-return-type-any");
const no_same_argument_assert_1 = require("./no-same-argument-assert");
const no_tab_1 = require("./no-tab");
const no_try_promise_1 = require("./no-try-promise");
const no_undefined_argument_1 = require("./no-undefined-argument");
const no_undefined_assignment_1 = require("./no-undefined-assignment");
const no_unenclosed_multiline_block_1 = require("./no-unenclosed-multiline-block");
const no_unsafe_unzip_1 = require("./no-unsafe-unzip");
const no_unthrown_error_1 = require("./no-unthrown-error");
const no_unused_function_argument_1 = require("./no-unused-function-argument");
const no_useless_increment_1 = require("./no-useless-increment");
const no_useless_intersection_1 = require("./no-useless-intersection");
const no_variable_usage_before_declaration_1 = require("./no-variable-usage-before-declaration");
const no_vue_bypass_sanitization_1 = require("./no-vue-bypass-sanitization");
const no_weak_cipher_1 = require("./no-weak-cipher");
const no_weak_keys_1 = require("./no-weak-keys");
const no_wildcard_import_1 = require("./no-wildcard-import");
const non_number_in_arithmetic_expression_1 = require("./non-number-in-arithmetic-expression");
const null_dereference_1 = require("./null-dereference");
const operation_returning_nan_1 = require("./operation-returning-nan");
const os_command_1 = require("./os-command");
const post_message_1 = require("./post-message");
const prefer_default_last_1 = require("./prefer-default-last");
const prefer_promise_shorthand_1 = require("./prefer-promise-shorthand");
const prefer_type_guard_1 = require("./prefer-type-guard");
const process_argv_1 = require("./process-argv");
const production_debug_1 = require("./production-debug");
const pseudo_random_1 = require("./pseudo-random");
const publicly_writable_directories_1 = require("./publicly-writable-directories");
const regex_complexity_1 = require("./regex-complexity");
const regular_expr_1 = require("./regular-expr");
const session_regeneration_1 = require("./session-regeneration");
const shorthand_property_grouping_1 = require("./shorthand-property-grouping");
const single_character_alternation_1 = require("./single-character-alternation");
const slow_regex_1 = require("./slow-regex");
const sockets_1 = require("./sockets");
const sonar_block_scoped_var_1 = require("./sonar-block-scoped-var");
const sonar_max_lines_1 = require("./sonar-max-lines");
const sonar_max_lines_per_function_1 = require("./sonar-max-lines-per-function");
const sonar_no_control_regex_1 = require("./sonar-no-control-regex");
const sonar_no_fallthrough_1 = require("./sonar-no-fallthrough");
const sonar_no_invalid_regexp_1 = require("./sonar-no-invalid-regexp");
const sonar_no_misleading_character_class_1 = require("./sonar-no-misleading-character-class");
const sonar_no_regex_spaces_1 = require("./sonar-no-regex-spaces");
const sonar_no_unused_vars_1 = require("./sonar-no-unused-vars");
const sql_queries_1 = require("./sql-queries");
const standard_input_1 = require("./standard-input");
const stateful_regex_1 = require("./stateful-regex");
const strict_transport_security_1 = require("./strict-transport-security");
const strings_comparison_1 = require("./strings-comparison");
const super_invocation_1 = require("./super-invocation");
const switch_without_default_1 = require("./switch-without-default");
const test_check_exception_1 = require("./test-check-exception");
const todo_tag_1 = require("./todo-tag");
const too_many_break_or_continue_in_loop_1 = require("./too-many-break-or-continue-in-loop");
const unicode_aware_regex_1 = require("./unicode-aware-regex");
const unused_import_1 = require("./unused-import");
const unused_named_groups_1 = require("./unused-named-groups");
const unverified_certificate_1 = require("./unverified-certificate");
const unverified_hostname_1 = require("./unverified-hostname");
const updated_const_var_1 = require("./updated-const-var");
const updated_loop_counter_1 = require("./updated-loop-counter");
const use_type_alias_1 = require("./use-type-alias");
const useless_string_operation_1 = require("./useless-string-operation");
const values_not_convertible_to_numbers_1 = require("./values-not-convertible-to-numbers");
const variable_name_1 = require("./variable-name");
const void_use_1 = require("./void-use");
const weak_ssl_1 = require("./weak-ssl");
const web_sql_database_1 = require("./web-sql-database");
const x_powered_by_1 = require("./x-powered-by");
const xml_parser_xxe_1 = require("./xml-parser-xxe");
const xpath_1 = require("./xpath");
const ruleModules = {};
exports.rules = ruleModules;
ruleModules['anchor-precedence'] = anchor_precedence_1.rule;
ruleModules['argument-type'] = argument_type_1.rule;
ruleModules['arguments-order'] = arguments_order_1.rule;
ruleModules['arguments-usage'] = arguments_usage_1.rule;
ruleModules['array-callback-without-return'] = array_callback_without_return_1.rule;
ruleModules['array-constructor'] = array_constructor_1.rule;
ruleModules['arrow-function-convention'] = arrow_function_convention_1.rule;
ruleModules['assertions-in-tests'] = assertions_in_tests_1.rule;
ruleModules['bitwise-operators'] = bitwise_operators_1.rule;
ruleModules['bool-param-default'] = bool_param_default_1.rule;
ruleModules['call-argument-line'] = call_argument_line_1.rule;
ruleModules['certificate-transparency'] = certificate_transparency_1.rule;
ruleModules['chai-determinate-assertion'] = chai_determinate_assertion_1.rule;
ruleModules['class-name'] = class_name_1.rule;
ruleModules['class-prototype'] = class_prototype_1.rule;
ruleModules['code-eval'] = code_eval_1.rule;
ruleModules['comma-or-logical-or-case'] = comma_or_logical_or_case_1.rule;
ruleModules['comment-regex'] = comment_regex_1.rule;
ruleModules['concise-regex'] = concise_regex_1.rule;
ruleModules['conditional-indentation'] = conditional_indentation_1.rule;
ruleModules['confidential-information-logging'] = confidential_information_logging_1.rule;
ruleModules['constructor-for-side-effects'] = constructor_for_side_effects_1.rule;
ruleModules['content-length'] = content_length_1.rule;
ruleModules['content-security-policy'] = content_security_policy_1.rule;
ruleModules['cookie-no-httponly'] = cookie_no_httponly_1.rule;
ruleModules['cookies'] = cookies_1.rule;
ruleModules['cors'] = cors_1.rule;
ruleModules['csrf'] = csrf_1.rule;
ruleModules['cyclomatic-complexity'] = cyclomatic_complexity_1.rule;
ruleModules['declarations-in-global-scope'] = declarations_in_global_scope_1.rule;
ruleModules['deprecation'] = deprecation_1.rule;
ruleModules['destructuring-assignment-syntax'] = destructuring_assignment_syntax_1.rule;
ruleModules['different-types-comparison'] = different_types_comparison_1.rule;
ruleModules['disabled-auto-escaping'] = disabled_auto_escaping_1.rule;
ruleModules['disabled-resource-integrity'] = disabled_resource_integrity_1.rule;
ruleModules['disabled-timeout'] = disabled_timeout_1.rule;
ruleModules['dns-prefetching'] = dns_prefetching_1.rule;
ruleModules['duplicates-in-character-class'] = duplicates_in_character_class_1.rule;
ruleModules['empty-string-repetition'] = empty_string_repetition_1.rule;
ruleModules['encryption'] = encryption_1.rule;
ruleModules['encryption-secure-mode'] = encryption_secure_mode_1.rule;
ruleModules['existing-groups'] = existing_groups_1.rule;
ruleModules['expression-complexity'] = expression_complexity_1.rule;
ruleModules['file-header'] = file_header_1.rule;
ruleModules['file-name-differ-from-class'] = file_name_differ_from_class_1.rule;
ruleModules['file-permissions'] = file_permissions_1.rule;
ruleModules['file-uploads'] = file_uploads_1.rule;
ruleModules['fixme-tag'] = fixme_tag_1.rule;
ruleModules['for-in'] = for_in_1.rule;
ruleModules['for-loop-increment-sign'] = for_loop_increment_sign_1.rule;
ruleModules['frame-ancestors'] = frame_ancestors_1.rule;
ruleModules['function-inside-loop'] = function_inside_loop_1.rule;
ruleModules['function-name'] = function_name_1.rule;
ruleModules['function-return-type'] = function_return_type_1.rule;
ruleModules['future-reserved-words'] = future_reserved_words_1.rule;
ruleModules['generator-without-yield'] = generator_without_yield_1.rule;
ruleModules['hashing'] = hashing_1.rule;
ruleModules['hidden-files'] = hidden_files_1.rule;
ruleModules['in-operator-type-error'] = in_operator_type_error_1.rule;
ruleModules['inconsistent-function-call'] = inconsistent_function_call_1.rule;
ruleModules['index-of-compare-to-positive-number'] = index_of_compare_to_positive_number_1.rule;
ruleModules['insecure-cookie'] = insecure_cookie_1.rule;
ruleModules['insecure-jwt-token'] = insecure_jwt_token_1.rule;
ruleModules['inverted-assertion-arguments'] = inverted_assertion_arguments_1.rule;
ruleModules['label-position'] = label_position_1.rule;
ruleModules['max-union-size'] = max_union_size_1.rule;
ruleModules['misplaced-loop-counter'] = misplaced_loop_counter_1.rule;
ruleModules['nested-control-flow'] = nested_control_flow_1.rule;
ruleModules['new-operator-misuse'] = new_operator_misuse_1.rule;
ruleModules['no-accessor-field-mismatch'] = no_accessor_field_mismatch_1.rule;
ruleModules['no-alphabetical-sort'] = no_alphabetical_sort_1.rule;
ruleModules['no-angular-bypass-sanitization'] = no_angular_bypass_sanitization_1.rule;
ruleModules['no-array-delete'] = no_array_delete_1.rule;
ruleModules['no-associative-arrays'] = no_associative_arrays_1.rule;
ruleModules['no-built-in-override'] = no_built_in_override_1.rule;
ruleModules['no-case-label-in-switch'] = no_case_label_in_switch_1.rule;
ruleModules['no-clear-text-protocols'] = no_clear_text_protocols_1.rule;
ruleModules['no-code-after-done'] = no_code_after_done_1.rule;
ruleModules['no-commented-code'] = no_commented_code_1.rule;
ruleModules['no-dead-store'] = no_dead_store_1.rule;
ruleModules['no-delete-var'] = no_delete_var_1.rule;
ruleModules['no-duplicate-in-composite'] = no_duplicate_in_composite_1.rule;
ruleModules['no-empty-after-reluctant'] = no_empty_after_reluctant_1.rule;
ruleModules['no-empty-alternatives'] = no_empty_alternatives_1.rule;
ruleModules['no-empty-group'] = no_empty_group_1.rule;
ruleModules['no-equals-in-for-termination'] = no_equals_in_for_termination_1.rule;
ruleModules['no-for-in-iterable'] = no_for_in_iterable_1.rule;
ruleModules['no-function-declaration-in-block'] = no_function_declaration_in_block_1.rule;
ruleModules['no-global-this'] = no_global_this_1.rule;
ruleModules['no-globals-shadowing'] = no_globals_shadowing_1.rule;
ruleModules['no-hardcoded-credentials'] = no_hardcoded_credentials_1.rule;
ruleModules['no-hardcoded-ip'] = no_hardcoded_ip_1.rule;
ruleModules['no-implicit-dependencies'] = no_implicit_dependencies_1.rule;
ruleModules['no-implicit-global'] = no_implicit_global_1.rule;
ruleModules['no-in-misuse'] = no_in_misuse_1.rule;
ruleModules['no-incomplete-assertions'] = no_incomplete_assertions_1.rule;
ruleModules['no-inconsistent-returns'] = no_inconsistent_returns_1.rule;
ruleModules['no-incorrect-string-concat'] = no_incorrect_string_concat_1.rule;
ruleModules['no-infinite-loop'] = no_infinite_loop_1.rule;
ruleModules['no-intrusive-permissions'] = no_intrusive_permissions_1.rule;
ruleModules['no-invalid-await'] = no_invalid_await_1.rule;
ruleModules['no-invariant-returns'] = no_invariant_returns_1.rule;
ruleModules['no-ip-forward'] = no_ip_forward_1.rule;
ruleModules['no-labels'] = no_labels_1.rule;
ruleModules['no-mime-sniff'] = no_mime_sniff_1.rule;
ruleModules['no-misleading-array-reverse'] = no_misleading_array_reverse_1.rule;
ruleModules['no-mixed-content'] = no_mixed_content_1.rule;
ruleModules['no-nested-assignment'] = no_nested_assignment_1.rule;
ruleModules['no-nested-conditional'] = no_nested_conditional_1.rule;
ruleModules['no-nested-incdec'] = no_nested_incdec_1.rule;
ruleModules['no-new-symbol'] = no_new_symbol_1.rule;
ruleModules['no-parameter-reassignment'] = no_parameter_reassignment_1.rule;
ruleModules['no-primitive-wrappers'] = no_primitive_wrappers_1.rule;
ruleModules['no-redundant-assignments'] = no_redundant_assignments_1.rule;
ruleModules['no-redundant-optional'] = no_redundant_optional_1.rule;
ruleModules['no-redundant-parentheses'] = no_redundant_parentheses_1.rule;
ruleModules['no-reference-error'] = no_reference_error_1.rule;
ruleModules['no-referrer-policy'] = no_referrer_policy_1.rule;
ruleModules['no-require-or-define'] = no_require_or_define_1.rule;
ruleModules['no-return-type-any'] = no_return_type_any_1.rule;
ruleModules['no-same-argument-assert'] = no_same_argument_assert_1.rule;
ruleModules['no-tab'] = no_tab_1.rule;
ruleModules['no-try-promise'] = no_try_promise_1.rule;
ruleModules['no-undefined-argument'] = no_undefined_argument_1.rule;
ruleModules['no-undefined-assignment'] = no_undefined_assignment_1.rule;
ruleModules['no-unenclosed-multiline-block'] = no_unenclosed_multiline_block_1.rule;
ruleModules['no-unsafe-unzip'] = no_unsafe_unzip_1.rule;
ruleModules['no-unthrown-error'] = no_unthrown_error_1.rule;
ruleModules['no-unused-function-argument'] = no_unused_function_argument_1.rule;
ruleModules['no-useless-increment'] = no_useless_increment_1.rule;
ruleModules['no-useless-intersection'] = no_useless_intersection_1.rule;
ruleModules['no-variable-usage-before-declaration'] = no_variable_usage_before_declaration_1.rule;
ruleModules['no-vue-bypass-sanitization'] = no_vue_bypass_sanitization_1.rule;
ruleModules['no-weak-cipher'] = no_weak_cipher_1.rule;
ruleModules['no-weak-keys'] = no_weak_keys_1.rule;
ruleModules['no-wildcard-import'] = no_wildcard_import_1.rule;
ruleModules['non-number-in-arithmetic-expression'] = non_number_in_arithmetic_expression_1.rule;
ruleModules['null-dereference'] = null_dereference_1.rule;
ruleModules['operation-returning-nan'] = operation_returning_nan_1.rule;
ruleModules['os-command'] = os_command_1.rule;
ruleModules['post-message'] = post_message_1.rule;
ruleModules['prefer-default-last'] = prefer_default_last_1.rule;
ruleModules['prefer-promise-shorthand'] = prefer_promise_shorthand_1.rule;
ruleModules['prefer-type-guard'] = prefer_type_guard_1.rule;
ruleModules['process-argv'] = process_argv_1.rule;
ruleModules['production-debug'] = production_debug_1.rule;
ruleModules['pseudo-random'] = pseudo_random_1.rule;
ruleModules['publicly-writable-directories'] = publicly_writable_directories_1.rule;
ruleModules['regex-complexity'] = regex_complexity_1.rule;
ruleModules['regular-expr'] = regular_expr_1.rule;
ruleModules['session-regeneration'] = session_regeneration_1.rule;
ruleModules['shorthand-property-grouping'] = shorthand_property_grouping_1.rule;
ruleModules['single-character-alternation'] = single_character_alternation_1.rule;
ruleModules['slow-regex'] = slow_regex_1.rule;
ruleModules['sockets'] = sockets_1.rule;
ruleModules['sonar-block-scoped-var'] = sonar_block_scoped_var_1.rule;
ruleModules['sonar-max-lines'] = sonar_max_lines_1.rule;
ruleModules['sonar-max-lines-per-function'] = sonar_max_lines_per_function_1.rule;
ruleModules['sonar-no-control-regex'] = sonar_no_control_regex_1.rule;
ruleModules['sonar-no-fallthrough'] = sonar_no_fallthrough_1.rule;
ruleModules['sonar-no-invalid-regexp'] = sonar_no_invalid_regexp_1.rule;
ruleModules['sonar-no-misleading-character-class'] = sonar_no_misleading_character_class_1.rule;
ruleModules['sonar-no-regex-spaces'] = sonar_no_regex_spaces_1.rule;
ruleModules['sonar-no-unused-vars'] = sonar_no_unused_vars_1.rule;
ruleModules['sql-queries'] = sql_queries_1.rule;
ruleModules['standard-input'] = standard_input_1.rule;
ruleModules['stateful-regex'] = stateful_regex_1.rule;
ruleModules['strict-transport-security'] = strict_transport_security_1.rule;
ruleModules['strings-comparison'] = strings_comparison_1.rule;
ruleModules['super-invocation'] = super_invocation_1.rule;
ruleModules['switch-without-default'] = switch_without_default_1.rule;
ruleModules['test-check-exception'] = test_check_exception_1.rule;
ruleModules['todo-tag'] = todo_tag_1.rule;
ruleModules['too-many-break-or-continue-in-loop'] = too_many_break_or_continue_in_loop_1.rule;
ruleModules['unicode-aware-regex'] = unicode_aware_regex_1.rule;
ruleModules['unused-import'] = unused_import_1.rule;
ruleModules['unused-named-groups'] = unused_named_groups_1.rule;
ruleModules['unverified-certificate'] = unverified_certificate_1.rule;
ruleModules['unverified-hostname'] = unverified_hostname_1.rule;
ruleModules['updated-const-var'] = updated_const_var_1.rule;
ruleModules['updated-loop-counter'] = updated_loop_counter_1.rule;
ruleModules['use-type-alias'] = use_type_alias_1.rule;
ruleModules['useless-string-operation'] = useless_string_operation_1.rule;
ruleModules['values-not-convertible-to-numbers'] = values_not_convertible_to_numbers_1.rule;
ruleModules['variable-name'] = variable_name_1.rule;
ruleModules['void-use'] = void_use_1.rule;
ruleModules['weak-ssl'] = weak_ssl_1.rule;
ruleModules['web-sql-database'] = web_sql_database_1.rule;
ruleModules['x-powered-by'] = x_powered_by_1.rule;
ruleModules['xml-parser-xxe'] = xml_parser_xxe_1.rule;
ruleModules['xpath'] = xpath_1.rule;
//# sourceMappingURL=main.js.map