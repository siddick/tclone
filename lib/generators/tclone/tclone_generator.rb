class TcloneGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument      :template_file_name, :type => :string,  :default => ""
  class_option  :recursive, :type => :boolean, :default => true,   :desc => "Do recursive template clone"

  def create_template_files
    clone_generator_templates( name )
  end

  private
  def clone_generator_templates( gname, goptions = [] )
    klass_obj = Rails::Generators.find_by_namespace( gname, *goptions )
    if( klass_obj )
      if( template_file_name != "" )
        clone_file( klass_obj.namespace, klass_obj.source_root, template_file_name )
      else
        clone_templates( klass_obj.namespace, klass_obj.source_root )
        if( options[:recursive] )
          for k,v in klass_obj.hooks 
            gk = klass_obj.class_options[k].default
            gk = ( gk == true ) ? k : gk
            clone_generator_templates( gk, v )
          end
        end
      end
    end
  end

  def clone_file( ns, path, filename )
    if( path and File.directory?( path ) and File.file?( path + "/" + filename ) )
      copy_file "#{path}/#{filename}", "lib/templates/#{ns.gsub(/:/,'/')}/#{filename}"
    end
  end

  def clone_templates( ns, path )
    puts ns
    if( path and File.directory? path )
      directory path, "lib/templates/#{ns.gsub(/:/,'/')}"
    end
  end

end
