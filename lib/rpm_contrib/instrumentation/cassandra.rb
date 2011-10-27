DependencyDetection.defer do
  @name = :cassandra

  depends_on do
    defined?(::Cassandra) && !NewRelic::Control.instance['disable_cassandra_instrumentation']
  end

  executes do
    NewRelic::Agent.logger.debug 'Installing Cassandra instrumentation'
  end

  executes do
    ::Cassandra.class_eval do
      add_method_tracer :login!,               'Database/Cassandra/login!'
      add_method_tracer :disconnect!,          'Database/Cassandra/disconnect!'
      add_method_tracer :reconnect!,           'Database/Cassandra/reconnect!'
      add_method_tracer :all_nodes,            'Database/Cassandra/all_nodes'
      add_method_tracer :keyspaces,            'Database/Cassandra/keyspaces'
      add_method_tracer :keyspace=,            'Database/Cassandra/keyspace='
      add_method_tracer :schema,               'Database/Cassandra/schema'
      add_method_tracer :schema_agreement?,    'Database/Cassandra/schema_agreement?'
      add_method_tracer :version,              'Database/Cassandra/version'
      add_method_tracer :cluster_name,         'Database/Cassandra/cluster_name'
      add_method_tracer :ring,                 'Database/Cassandra/ring'
      add_method_tracer :partitioner,          'Database/Cassandra/partitioner'
      add_method_tracer :truncate!,            'Database/Cassandra/truncate!'
      add_method_tracer :add_column_family,    'Database/Cassandra/add_column_family'
      add_method_tracer :drop_column_family,   'Database/Cassandra/drop_column_family'
      add_method_tracer :rename_column_family, 'Database/Cassandra/rename_column_family'
      add_method_tracer :update_column_family, 'Database/Cassandra/update_column_family'
      add_method_tracer :add_keyspace,         'Database/Cassandra/add_keyspace'
      add_method_tracer :drop_keyspace,        'Database/Cassandra/drop_keyspace'
      add_method_tracer :rename_keyspace,      'Database/Cassandra/rename_keyspace'
      add_method_tracer :update_keyspace,      'Database/Cassandra/update_keyspace'
      add_method_tracer :create_index,         'Database/Cassandra/create_index'
      add_method_tracer :drop_index,           'Database/Cassandra/drop_index'
      add_method_tracer :get_indexed_slices,   'Database/Cassandra/get_indexed_slices'
      add_method_tracer :insert,               'Database/Cassandra/insert'
      add_method_tracer :remove,               'Database/Cassandra/remove'
      add_method_tracer :clear_keyspace!,      'Database/Cassandra/clear_keyspace!'
      add_method_tracer :count_columns,        'Database/Cassandra/count_columns'
      add_method_tracer :multi_count_columns,  'Database/Cassandra/multi_count_columns'
      add_method_tracer :get_columns,          'Database/Cassandra/get_columns'
      add_method_tracer :multi_get_columns,    'Database/Cassandra/multi_get_columns'
      add_method_tracer :get,                  'Database/Cassandra/get'
      add_method_tracer :multi_get,            'Database/Cassandra/multi_get'
      add_method_tracer :exists?,              'Database/Cassandra/exists?'
      add_method_tracer :get_range,            'Database/Cassandra/get_range'
      add_method_tracer :count_range,          'Database/Cassandra/count_range'
      add_method_tracer :batch,                'Database/Cassandra/batch'
    end
  end
end
